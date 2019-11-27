# Copyright 2018, 2019 Cumulus Networks, Inc.  All Rights reserved.
#
# This software is subject to the Cumulus Networks End User License Agreement
# available at the following locations:
#
# Internet: https://cumulusnetworks.com/downloads/eula/latest/view/
# Cumulus Linux systems: /usr/share/cumulus/EULA.txt

from __future__ import absolute_import
from __future__ import division

import bisect
import hashlib
import ujson as json
import os
import socket
import subprocess
import time
import uuid
import inspect
import types
import errno

import eventlet
import eventlet.pools
import greenlet
import random

from multiprocessing import Process

from netq_lib.common import configuration, utils
from netq_lib.common.nlfullstate import NetlinkFullStateObject, FullState
from netq_agent.parsers import netlink
from netq_agent.parsers.netlink import NetlinkCopy
from netq_lib.common.enums import (
    Daemons,
    ConfKw,
    Heartbeat,
    NeighborState,
    LinkType,
    Platform,
    RunningService,
    CentosRunningService,
    RhelRunningService,
    RouteTable,
    ServiceStatus,
    StpPortState,
)

from netq_lib.common.service import Service
from netq_lib.common.agent_stats_monitor import AgentStatsMon
from netq_agent.parsers import (
    bgp,
    clag,
    lldpd,
    mstp,
    ntp,
    ospf,
    platform,
    systemctl,
    sensors,
    lnv,
    resourceUtil,
    agentStats,
    ports,
    ptm,
    runningConfigMonitor,
    proc,
    package,
    dpkg,
    clSupport
)

from netq_agent.parsers.configMonitor import configMon

from netq_lib.orm import HOSTNAME

import netq_lib.orm.redisdb.models  # for purging all classes in file @ init
from netq_lib.orm.redisdb import (
    curr_pipeline,
    new_pipeline,
    set_connection_settings,
    RedisException,
    ping_server,
    server_info,
    is_backend_sentinel_aware
)
from netq_lib.orm.redisdb.models import (
    Address,
    Command,
    Description,
    Link,
    Liveness,
    MacFdb,
    Neighbor,
    Node,
    Route,
    Services,
    VxlanRemoteDest,
    Netconf,
)

from netq_lib.orm.redisdb import unsubscribe_listener
from netq_agent.cmd.docker_agent import DockerMonitor
from netq_agent.cmd.kube_agent import KubeMonitor
from netq_agent.cmd.netq_grpc_agent import NetQAgentGrpcClient
from netq_lib.common.netq_pq import create_message_queues, setClAgentInst, NetQPriorityQueue
from netq_agent.cmd.agent_cli import AgentCli

_PROC_NAME = 'netq-agent'


class _Command(object):
    """Command class.
    """
    _MIN_PERIOD = 15           # minimum period for command runs: 15s
    _CMD_TIMEOUT = 5           # End the cmd if not finished within this time

    # pylint: disable=too-few-public-methods
    def __init__(self, period, key, command, service, callback=None,
                 always=False, tov=_CMD_TIMEOUT, fullstate=0):
        try:
            period = int(period)
        except ValueError:
            period = self._MIN_PERIOD
        self.period = self._MIN_PERIOD if period < self._MIN_PERIOD else period
        self.key = key
        self.command = command
        self.service = service
        # function to parse & push out structured data
        self.callback = callback
        self.always = always
        try:
            tov = int(tov)
        except ValueError:
            tov = self._CMD_TIMEOUT
        self.timeout = tov
        self.errcnt = 0
        self.fullstate = fullstate
        self.fullstateCnt = fullstate

    def __cmp__(self, other):
        return((self.period - other.period) < (other.period - self.period))

    def __eq__(self, other):
        return self.key == other.key and self.command == other.command

    def __ne__(self, other):
        return not self == other

    def __repr__(self):
        return '%s(period=%d, key=%s, command=%s)' % (
            self.__class__.__name__, self.period, self.key, self.command
        )


class _Thread(object):
    """Thread class.
    """
    def __init__(self):
        self.__function = None
        self.__pool = None
        self.__start_time = None
        self.__stop_checker = None
        self.green_thread = None
        self.pipeline = None

    def kill(self):
        eventlet.kill(self.green_thread)

    def link(self, stop_checker):
        self.__stop_checker = stop_checker
        self.green_thread.link(stop_checker)

    @classmethod
    def spawn(cls, epoch, pool, function, pipeline=None):
        thread = cls()
        thread.__function = function  # pylint: disable=protected-access
        thread.__pool = pool  # pylint: disable=protected-access
        thread.__start_time = epoch  # pylint: disable=protected-access
        thread.pipeline = pipeline
        if pipeline is not None:
            thread.green_thread = pool.spawn(function, pipeline)
        else:
            thread.green_thread = pool.spawn(function)
        return thread

    def stale(self, now):
        return now - self.__start_time >= Heartbeat.HEARTBEAT_DEATH

    def respawn(self, epoch):
        self.kill()
        thread = self.spawn(epoch, self.__pool, self.__function,
                            pipeline=self.pipeline)
        return thread


class _ClDbPush(Service):
    """
    This class defines the main workhorse class of this file.
    It parses the args, fires off the command event monitoring
    threads, and processes the outputs posted by these threads
    and adds them to a redis database.
    """
    __BRIDGE_FBD_REGEX = (
        r'(?:(?P<deleted>^Deleted)\s+)?'
        r'(?P<mac_address>\S+)'
        r'\s+\S+\s+(?P<nexthop>\S+)'
        r'(?=.*vlan\s+(?P<vlan_id>\d+))?'
        r'(?=.*\s+(?P<origin>permanent$))?'
        r'(?=.*dst\s+(?P<dst>\S+))?'
        r'(?=.*master\s+(?P<port>\S+))?'
    )

    __SERVICES_RATE = 15
    __NLPOLL_RATE = 30
    __NLPOLL_RETRY_MAX = 3
    __NLPOLL_RETRY_MIN = 1
    __PLATFORM_RATE = 30

    __CMD_TIMEOUT = 15

    __AGENT_PAUSE = False
    __AGENT_PAUSE_FIRST_RUN = False

    __FIRST_RUN = False

    __NETLINK_INIT_DONE = False
    __NETLINK_RESTART = False

    __NETLINK_COUNT = 2

    __INT_CMDS = {
        'zebra': [
            {
                "period": "30",
                "key": "zebra-ping",
                "command": "/usr/bin/vtysh -d zebra -c quit",
            }
        ],
        'bgpd': [
            {
                "period": "15",
                "key": "bgp-neighbors",
                "command": ["/usr/bin/vtysh", "-c",
                            "show ip bgp vrf all neighbors json"],
                "callback": bgp.process_bgp_neighbors,
            },
            {
                "period": "15",
                "key": "evpn-vni",
                "command": ["/usr/bin/vtysh", "-c",
                            "show bgp l2vpn evpn vni json"],
                "callback": bgp.process_bgp_evpn_vni,
            },
        ],
        'ospfd': [
            {
                "period": "15",
                "key": "ospf-neighbor-json",
                "command": ["/usr/bin/vtysh", "-c",
                            "show ip ospf vrf all neighbor detail json"],
                "callback": ospf.process_ospf_neighbors,
            },
            {
                "period": "15",
                "key": "ospf-interface-json",
                "command": ["/usr/bin/vtysh", "-c",
                            "show ip ospf vrf all interface json"],
                "callback": ospf.process_ospf_if,
            }

        ],
        'clagd': [
            {
                "period": "15",
                "key": "clagctl-json",
                "command": "/usr/bin/clagctl -j",
                "callback": clag.process_clagctl,
            }
        ],
        'dpkg': [
            {
                "period": "30",
                "key": "dpkg-query",
                "command": "dpkg-query --show -f ${Package},${Version},${Status}\\n",
                "callback": dpkg.process_dpkg,
            }
        ],
        'ptmctl': [
            {
                "period": "30",
                "key": "ptmctl-json",
                "command": "/usr/bin/ptmctl -d -j",
                "callback": ptm.process_ptmctl,
            }
        ],
        'mstpd': [
            {
                "period": "15",
                "key": "mstpctl-bridge-json",
                "command": "/sbin/mstpctl showall json",
                "callback": mstp.process_mstpall,
            }
        ],
        "misc": [
            {
                "period": "30",
                "key": "cl-license",
                "command": "/usr/sbin/switchd -lic",
                "callback": platform.process_cl_license,
            },
            {
                "period": "30",
                "key": "ports",
                "command": None,
                "callback": ports.process_ports,
            },
            {
                "period": "30",
                "key": "proc-net-dev",
                "command": None,
                "callback": proc.process_proc_net_dev,
            },
        ],
        "agentStats": [
            {
                "period": "300",
                "key": "agent_stats",
                "command": None,
                "callback": agentStats.process_agent_stats,
            },
            {
                "period": "15",
                "key": "agent_util_stats",
                "command": None,
                "callback": agentStats.process_agent_util_stats,
            }
        ],
        "lldpd": [
            {
                "period": "30",
                "key": "lldp-neighbor-json",
                "command": "/usr/sbin/lldpctl -f json",
                "callback": lldpd.process_lldpctl,
            }
        ],
        "configMon": [
            {
                "period": "30",
                "key": "config-mon-json",
                "command": None,
                "callback": configMon.process_config_mon,
            }
        ],
        "runningConfigMon": [
            {
                "period": "30",
                "key": "running-config-mon-json",
                "command": None,
                "callback": runningConfigMonitor.process_running_config_mon,
            }
        ],
        "clSupport": [
            {
                "period": "60",
                "key": "cl-support-json",
                "command": None,
                "callback": clSupport.process_cl_support,
            }
        ],
        "resourceUtil": [
            {
                "period": "30",
                "key": "resource-util-json",
                "command": None,
                "callback": resourceUtil.process_resource_util,
            }
        ],
        "smond": [
            {
                "period": "30",
                "key": "smonctl-json",
                "command": "/usr/sbin/smonctl -j",
                "callback": sensors.process_sensors,
            }
        ],
        "vxrd": [
            {
                "period": "15",
                "key": "vxrd-show-json",
                "command": "/usr/bin/vxrdctl -j show",
                "callback": lnv.process_vxrdctl_show,
            },
            {
                "period": "15",
                "key": "vxrd-peers-json",
                "command": "/usr/bin/vxrdctl -j peers",
                "callback": lnv.process_vxrdctl_peers,
            }
        ],
        "vxsnd": [
            {
                "period": "15",
                "key": "vxsnd-show-json",
                "command": "/usr/bin/vxsndctl -j show",
                "callback": lnv.process_vxsndctl_show,
            },
            {
                "period": "15",
                "key": "vxsnd-fdb-json",
                "command": "/usr/bin/vxsndctl -j fdb",
                "callback": lnv.process_vxsndctl_fdb,
            },
            {
                "period": "15",
                "key": "vxsnd-config-json",
                "command": "/usr/bin/vxsndctl -j get config",
                "callback": lnv.process_vxsndctl_get_config,
            }
         ]
    }

    __MAX_REDIS_CONNECTIONS = 10

    __PIPELINE_RATE = 1

    __MAX_SERVER_INFO_FAIL_CNT = 3
    __SERVERINFO_RATE = 15

    __REDISTRIBUTE_NBR_TABLE_ID = 10

    __NON_CLS_MODELS = ['_RedisModel', 'RedisQuery', 'Connection', 'MemModel',
                        'Node', 'Liveness', 'ProcNetDevInterface', 'datetime',
                        'NetQPriorityQueue', 'QueueElem', 'NetQIPC']
    __NL_CLS_MODELS = ['Link', 'Address', 'Neighbor', 'Route', 'NetConf']

    __FRR_DOCKER_DEFAULT = 'cumulus-frr'

    def __init__(self, conf, grpc_stream_process):
        super(_ClDbPush, self).__init__(conf, _PROC_NAME,
                                        shutdown_callbacks=[unsubscribe_listener])
        self.__commands = []
        self.__command_buffer = {}
        self.__heartbeat_gt = None
        self.__hostname = HOSTNAME
        self.__prev_hostname = 'unknown'
        self.__ifname_by_index = None
        self.__lastboot = time.time()
        self.__last_reinit = time.time()
        self.__nlinit_gt = None
        self.__nlmonitor_gt = None
        self.__vxlan_vlan_map = {}
        self.__link_kind_map = {}
        self.__link_table_map = {}  # Link to route table map
        self.__link_vrf_map = {}    # Link to VRF map, may not be direct master
        self.__rt_protos_map = {}
        self.__link_master_map = {}  # Map of master for i/fs with a master
        self.__addr_ifindex_map = {} # Map of addr to ifindex when ifname is none
        self.__to_update_master_links = {}
        self.__nlmonitor = netlink.Netlink(
            _PROC_NAME,
            self._conf,
            self._logger,
            {netlink.Netlink.NEWADDR: self.__rx_rtm_newaddr,
             netlink.Netlink.DELADDR: self.__rx_rtm_deladdr,
             netlink.Netlink.NEWLINK: self.__rx_rtm_newlink,
             netlink.Netlink.DELLINK: self.__rx_rtm_dellink,
             netlink.Netlink.NEWNEIGH: self.__rx_rtm_newneigh,
             netlink.Netlink.DELNEIGH: self.__rx_rtm_delneigh,
             netlink.Netlink.NEWROUTE: self.__rx_rtm_newroute,
             netlink.Netlink.DELROUTE: self.__rx_rtm_delroute,
             netlink.Netlink.NEWNETCONF: self.__rx_rtm_newnetconf},
            pool=self._pool
        )
        self.__prev_cmd = {}
        self.__prev_cntr = {}
        self.__prev_cntr = {}
        self.__redispool = eventlet.pools.TokenPool(
            max_size=self.__MAX_REDIS_CONNECTIONS
        )
        self.__redisthreads = set()
        self.__reinitpool = eventlet.pools.TokenPool(max_size=1)
        self.__heartbeatpool = eventlet.pools.TokenPool(max_size=1)
        self.__serverinfopool = eventlet.pools.TokenPool(max_size=1)
        self.__server_info_fail_cnt = 0
        self.__timers = {}
        self.__platform = self.__get_platform()
        self.__agent_version = self.__get_agent_version()
        self.__chassis_card = self._is_chassis_card()
        self.__server_info = {}
        self.__ports = set()
        self.__docker = DockerMonitor(self._conf, self._logger, platform=self.__platform,
                                      pool=self._pool)
        self.__kubernetes = KubeMonitor(self._conf, self._logger, platform=self.__platform,
                                        pool=self._pool)

        if os.path.exists('/proc/uptime'):
            with open('/proc/uptime', 'r') as f:
                up_secs = f.readline().split()[0]
        else:
            up_secs = 0
        self.__node_uptime = self.__lastboot - float(up_secs)

        # check if interface stats is enabled
        self.__intf_stats_enabled = self.__is_intf_stats_enabled()

        # check if opta config enabled
        self.__opta_enabled = self.__is_opta_enabled()

        # check if randon platform config enabled
        self.__random_platform_info = self.__get_random_platform()

        # check if redis config enabled
        self.__redis_enabled = self.__is_redis_enabled()

        # init frr docker name if enabled
        self.__frr_docker_enabled = self.__init_frr_docker()

        # full_state period/timer
        self.__fullstate_period = self.__get_fullstate_period()

        # full state period timer for platform data
        self.__platform_fullstate_timer = self.__fullstate_period

        # trace grpc Q full state
        self.__grpc_q_full = False
        self.__nl_poll_retry = 0
        self.__nl_poll_retry_max = self.__NLPOLL_RETRY_MAX

        self.__grpc_state = False

        if self.__fullstate_period:
            self.full_state_object = NetlinkFullStateObject
        else:
            self.full_state_object = None

        # Stream Process
        self.__grpc_stream_process = grpc_stream_process

        # The following parameters are for the activate agent resume state
        self.__backoff_timer = 0
        self.__next_reinit_time = 0
        self.__backoff_timer_step = 5
        self.__latest_pause_time = time.time()
        self.__agent_stable_time = self.__backoff_timer_step * 6

        #AGENT CLI
        self.__agent_cli = AgentCli(self._pool, self._logger, self.__nlmonitor)

        setClAgentInst(self)

    def get_nlmonitor(self):
        return self.__nlmonitor

    def __run_safe_cmd(self, command, timeout=__CMD_TIMEOUT):
        """Run time-limited command and return status & cmd output
        return code is 0 for successful commands and non-zero otherwise
        """
        cmd_out = retcode = None
        try:
            if isinstance(command, basestring):
                cmd = subprocess.Popen(command.split(),
                                       stdout=subprocess.PIPE,
                                       stderr=subprocess.STDOUT,
                                       shell=False)
            else:
                cmd = subprocess.Popen(command,
                                       stdout=subprocess.PIPE,
                                       stderr=subprocess.STDOUT,
                                       shell=False)
        except (subprocess.CalledProcessError, OSError):
            return -1, ''

        identifier = uuid.uuid4().hex
        green_thread = self._pool.spawn(cmd.communicate)
        green_thread.link(self.__stop_command_checker, identifier, command)
        endtime = time.time() + int(timeout)

        while True:
            if identifier in self.__command_buffer:
                cmd_out = self.__command_buffer.pop(identifier)
                if cmd_out is None:
                    retcode = -1
                else:
                    retcode = cmd.returncode
                break
            if time.time() > endtime:
                self._logger.debug('Failed to execute command %s after %d '
                                   'seconds', command, timeout)
                eventlet.kill(green_thread, greenlet.GreenletExit)
                retcode = -1
                break
            eventlet.sleep(1)
        if retcode != 0:
            self._logger.debug('Command %s returned %d', command, retcode)
        return retcode, cmd_out

    def __docker_routing_svc_running(self, daemon):

        if not self.__frr_docker_name:
            return False

        dockerbin = self.__get_docker_bin()

        cmdstr = "".join((dockerbin, ' exec ', self.__frr_docker_name,
                    '/usr/lib/frr/frr', 'status'))

        try:
            retcode, cmd_out = subprocess.check_output(cmdstr.split(),
                                        stderr=subprocess.STDOUT).strip()
        except (subprocess.CalledProcessError, OSError):
            return False

        if retcode:
            return False

        # FRR docker status will print something like this
        #
        #  * zebra is running
        #  * bgpd is running

        lines = cmd_out.splitlines()
        for line in lines:
            if daemon not in line:
                continue
            if 'running' in line:
                return True
        return False

    def __generic_routing_svc_running(self, daemon):

        if os.path.isdir('/etc/frr'):
            svc_name = RunningService.FRR
        else:
            svc_name = RunningService.QUAGGA

        cmdstr = '/bin/systemctl is-active %s.service' % svc_name

        try:
            subprocess.check_output(cmdstr.split(),
                                        stderr=subprocess.STDOUT).strip()
        except (subprocess.CalledProcessError, OSError):
            return False

        # Quagga / FRR daemons need one more check
        cmdstr = '/bin/grep %s=yes /etc/%s/daemons' % (daemon, svc_name)
        try:
            subprocess.check_output(cmdstr.split(),
                                        stderr=subprocess.STDOUT).strip()
            return True
        except (subprocess.CalledProcessError, OSError):
            return False

    def __is_routing_service_running(self, daemon):

        if self.__frr_docker_enabled:
            # we are asked to work with FRR docker
            return self.__docker_routing_svc_running(daemon)
        else:
            return self.__generic_routing_svc_running(daemon)

    def __is_service_running(self, daemon):
        """Check if service is running. Works across systemctl & service
        models.
        """
        routing_daemons = [Daemons.BGPD, Daemons.OSPFD, Daemons.OSPF6D,
                          Daemons.ZEBRA]

        if daemon in routing_daemons:
            return self.__is_routing_service_running(daemon)

        if os.path.isfile('/bin/systemctl'):
            cmdstr = '/bin/systemctl is-active %s' % daemon
        else:
            cmdstr = '/usr/sbin/service %s status' % daemon

        try:
            subprocess.check_output(cmdstr.split(),
                                        stderr=subprocess.STDOUT).strip()
        except (subprocess.CalledProcessError, OSError):
            return False

        return True

    def __docker_routing_svc_failed(self, daemon):

        if not self.__frr_docker_name:
            return True

        dockerbin = self.__get_docker_bin()
        cmdstr = "".join((dockerbin, ' exec ', self.__frr_docker_name,
                    '/usr/lib/frr/frr', 'status'))
        try:
            retcode, cmd_out = subprocess.check_output(cmdstr.split(),
                                        stderr=subprocess.STDOUT).strip()
        except (subprocess.CalledProcessError, OSError):
            return True

        if retcode:
            return True

        # FRR docker status will print something like this
        #
        #  * zebra is running
        #  * bgpd is running

        lines = cmd_out.splitlines()
        for line in lines:
            if daemon not in line:
                continue
            if 'running' in line:
                return False
        return True

    def __generic_routing_svc_failed(self, daemon):

        if os.path.isdir('/etc/frr'):
            svc_name = RunningService.FRR
        else:
            svc_name = RunningService.QUAGGA

        cmdstr = '/bin/systemctl is-failed %s.service' % svc_name

        try:
            subprocess.check_output(cmdstr.split(),
                                    stderr=subprocess.STDOUT).strip()
            return True
        except (subprocess.CalledProcessError, OSError) as ex:
            #attrib 'output' only present for CalledProcessError
            out = getattr(ex, 'output', None)
            if out and 'active' in out:
                cmdstr = '/usr/bin/vtysh -d %s -c quit' % daemon
                try:
                    subprocess.check_output(cmdstr.split(),
                                            stderr=subprocess.STDOUT)
                except (subprocess.CalledProcessError, OSError):
                    return True
            return False

    def __is_routing_service_failed(self, daemon):

        if self.__frr_docker_enabled:
            # we are asked to work with FRR docker
            return self.__docker_routing_svc_failed(daemon)
        else:
            return self.__generic_routing_svc_failed(daemon)

    def __has_service_failed(self, daemon):
        """Check if service has failed. Works only with systemctl for now
        """
        routing_daemons = [Daemons.BGPD, Daemons.OSPFD, Daemons.OSPF6D,
                          Daemons.ZEBRA]

        if daemon in routing_daemons:
            return self.__is_routing_service_failed(daemon)

        if os.path.isfile('/bin/systemctl'):
            cmdstr = '/bin/systemctl is-failed %s' % daemon
        else:
            cmdstr = '/usr/sbin/service %s status' % daemon

        try:
            subprocess.check_output(cmdstr.split(),
                                          stderr=subprocess.STDOUT).strip()
            return True
        except (subprocess.CalledProcessError, OSError):
            return False

    def __load_commands(self):
        """Determine what info to push based on box configuration.
        """
        cmdlist = self.__INT_CMDS
        self.__timers = {}

        if self.__chassis_card:
            send_sensors = False
            if (self._conf.get('netq-agent') and
                    self._conf['netq-agent'].get('send_chassis_sensor_data')):
                send_sensors = (
                    self._conf['netq-agent']['send_chassis_sensor_data'])
                if not isinstance(send_sensors, types.BooleanType):
                    if str(send_sensors).lower() in ('true', 'yes', 'on'):
                        send_sensors = True
                    else:
                        send_sensors = False
            if not send_sensors:
                self._logger.info('Not sending sensor data from chassis card')
                del cmdlist['smond']

        if not self.__intf_stats_enabled:
            # remove interface polling command
            for entry in cmdlist['misc']:
                if entry.get("key") == "proc-net-dev":
                    cmdlist['misc'].remove(entry)

        if 'user-commands' not in self._conf:
            self._logger.debug('No user commands found in config file')

        for entry in self._conf.get('user-commands', []):
            service = entry.get('service', 'misc')
            commands = entry.get('commands', [])
            if commands:
                if service in cmdlist:
                    cmdlist[service].append(commands)
                else:
                    cmdlist[service] = commands

        for service, commands in cmdlist.iteritems():
            for command in commands:
                if isinstance(command, list):
                    newcmds = command
                else:
                    newcmds = [command]
                for command in newcmds:
                    if all(k in command
                           for k in ('period', 'key', 'command')):
                        # last param is None because there is no
                        # command to parse out the info and push it out
                        cmd = _Command(int(command['period']),
                                       str(command['key'].strip()),
                                       command['command'],
                                       str(service),
                                       command.get('callback', None),
                                       command.get('run', None) ==
                                       'always',
                                       command.get('timeout', self.__CMD_TIMEOUT),
                                       self.__fullstate_period)
                        idx = bisect.bisect_left(self.__commands, cmd)
                        if (idx >= len(self.__commands) or
                            self.__commands[idx] != cmd):
                            bisect.insort(self.__commands, cmd)
                        else:
                            self._logger.info('Ignoring invalid line %r', command)

        epoch = int(time.time())
        for cmd in self.__commands:
            self.__timers.setdefault(epoch + cmd.period, set())
            self.__timers[epoch + cmd.period].add(cmd)

    def __get_docker_bin(self):

        if 'rhel' in self.__platform.lower():
            cmd = '/bin/docker'
        elif 'red hat' in self.__platform.lower():
            cmd = '/bin/docker'
        elif 'centos' in self.__platform.lower():
            cmd = '/bin/docker'
        else:
            cmd = '/usr/bin/docker'

        return cmd

    def __get_frr_docker_pids(self):

        routing_daemons = [Daemons.BGPD, Daemons.OSPFD, Daemons.OSPF6D,
                           Daemons.ZEBRA]

        if not self.__frr_docker_name and bool(self.__frr_docker_child_pid):
            # update services
            for daemon in routing_daemons:
                if self.__frr_docker_child_pid.get(daemon):
                    self.__frr_docker_child_pid[daemon] = 'n/a'
            try:
                systemctl.process_frr_docker_service(self.__frr_docker_child_pid,
                                                     self.__frr_docker_start_time)
            except Exception as ex:  # pylint: disable=broad-except
                self._logger.info('Failed to process frr docker services. Error: %s', ex)
            return

        dockerbin = self.__get_docker_bin()
        cmd = ' --format "{{.State.Pid}}"'
        dockercmd = dockerbin + ' inspect ' + self.__frr_docker_name + cmd

        retcode, cmd_out = self.__run_safe_cmd(dockercmd)
        if retcode:
            self._logger.info('Failed to get FRR docker pid %x', retcode)
            return

        self.__frr_docker_pid = cmd_out.strip('"\n')

        self._logger.debug('Found FRR docker pid %s', self.__frr_docker_pid)

        # now get the frr daemon pids
        # grab all child pids of this container
        cmd = (' --ppid %s --format pid,cmd' % (self.__frr_docker_pid))
        dockercmd = dockerbin + ' top ' + self.__frr_docker_name + cmd

        retcode, cmd_out = self.__run_safe_cmd(dockercmd)

        if retcode:
            self._logger.info('Failed to get FRR docker child pids %x', retcode)
            return

        # ex. of docker top output from previous cmd
        # PID      CMD
        # 8426     /usr/lib/frr/zebra -M snmp -s 90000000 --daemon -A 127.0.0.1
        # 8442     /usr/lib/frr/bgpd -M snmp --daemon -A 127.0.0.1
        # 8448     /usr/lib/frr/watchfrr -adz -r /usr/sbin...

        routing_daemons = [Daemons.BGPD, Daemons.OSPFD, Daemons.OSPF6D,
                           Daemons.ZEBRA]

        self.__frr_docker_child_pid = {}
        lines = cmd_out.splitlines()
        for line in lines:
            if 'PID' in line:
                continue
            childpid = line.split()[0]
            cmdstr = line.split()[1]
            if 'watchfrr' in cmdstr:
                continue
            for daemon in routing_daemons:
                if daemon in cmdstr:
                    self.__frr_docker_child_pid[daemon] = childpid
                    self._logger.debug('Found FRR daemon %s pid %s',
                        daemon, childpid)

        # update services
        try:
            systemctl.process_frr_docker_service(self.__frr_docker_child_pid,
                                                 self.__frr_docker_start_time)
        except Exception as ex:  # pylint: disable=broad-except
            self._logger.debug('Failed to process frr docker services. Error: %s', ex)
            self.__frr_docker_child_pid = {}
        return

    def __get_frr_docker_start_time(self):

        if not self.__frr_docker_name:
            self.__frr_docker_start_time = None
            return

        # get the frr docker start time
        cmd = ' --format="{{.State.StartedAt}}" '
        dockercmd = self.__get_docker_bin() + ' inspect ' + \
                    self.__frr_docker_name + cmd

        retcode, cmd_out = self.__run_safe_cmd(dockercmd)

        if retcode:
            self._logger.info('Failed to get FRR docker start time %x', retcode)
            self.__frr_docker_start_time = None
            return

        self._logger.debug('Updated FRR docker start time %s', cmd_out)

        # convert into unix timestamps
        xargcmd = 'xargs -n1 date +%s -d ' + cmd_out.strip('"\n')
        retcode, cmd_out = self.__run_safe_cmd(xargcmd)
        if retcode:
            self._logger.info('Failed to convert FRR docker start time %x', retcode)
            self.__frr_docker_start_time = None
            return

        self.__frr_docker_start_time = cmd_out.strip('"\n')
        self._logger.debug('Updated FRR docker start time utc %s',
                           self.__frr_docker_start_time)

    def __update_frr_docker_info(self):

        self.__get_frr_docker_name()

        if not self.__frr_docker_name:
            return

        # keep track of container pid
        # also get the bgp, zebra, ospf child pids
        if not bool(self.__frr_docker_child_pid):
            self.__get_frr_docker_pids()

    def __get_frr_docker_name(self):
        old_frr = self.__frr_docker_name
        self.__frr_docker_name = None

        cmd = ' ps --format "{{.Names}}"'
        dockercmd = self.__get_docker_bin() + cmd

        retcode, cmd_out = self.__run_safe_cmd(dockercmd)
        if retcode:
            self._logger.debug('Failed to run docker ps retcode - %x', retcode)
            return

        first_frr = None
        lines = cmd_out.splitlines()
        for line in lines:
            if self.__frr_docker_conf_name not in line:
                continue
            # ignore certain kube instances
            if 'POD' in line:
                continue
            # mark the first frr we see
            curr_frr = line.strip('"')
            if not first_frr:
                first_frr = curr_frr
            if not old_frr or curr_frr == old_frr:
                #  we found it !
                self.__frr_docker_name = curr_frr
                break

        if old_frr and not self.__frr_docker_name and first_frr:
            # we had a previous frr docker, which
            # we did not find in this run.
            # use whatever we got
            self.__frr_docker_name = first_frr

        change = True
        if old_frr and not self.__frr_docker_name:
            self._logger.info('No frr docker matching %s',
                               self.__frr_docker_conf_name)
        elif old_frr != self.__frr_docker_name:
            self._logger.info('Setting new frr docker to be %s',
                               self.__frr_docker_name)
        else:
            # no change to frr name
            self._logger.debug('Keeping frr docker to be %s',
                               self.__frr_docker_name)
            change = False

        # keep track of container start time
        if change:
            self.__get_frr_docker_start_time()

    def __get_fullstate_period(self):
        val = ConfKw.DEFAULT_FULLSTATE_PERIOD
        if self._conf.get('netq-agent'):
            val = self._conf.get('netq-agent').get(ConfKw.FULLSTATE_PERIOD, ConfKw.DEFAULT_FULLSTATE_PERIOD)
        if val:
            self._logger.info('Agent FULLSTATE period enabled %s', val)
        else:
            self._logger.info('Agent FULLSTATE disabled')
        return val


    def __is_redis_enabled(self):
        if (self._conf.get('netq-agent') and
                self._conf.get('netq-agent').get(ConfKw.IS_REDIS_ENABLED, ConfKw.DEFAULT_IS_REDIS_ENABLED)):
            self._logger.info('REDIS configuration Enabled')
            return True
        else:
            self._logger.info('REDIS configuration not found')
            return False

    def __get_random_platform(self):
        platform = 0
        if self._conf.get('netq-agent'):
            platform = self._conf.get('netq-agent').get(ConfKw.RANDOM_PLATFORM, 0)
        if platform:
            self._logger.info('Random Platform Enabled %d', platform)
        else:
            self._logger.debug('Random Platform not found')
        return platform

    def __is_opta_enabled(self):
        if (self._conf.get('netq-agent') and
                self._conf.get('netq-agent').get(ConfKw.IS_OPTA_ENABLED, ConfKw.DEFAULT_IS_OPTA_ENABLED)):
            self._logger.info('OPTA configuration Enabled')
            return True
        else:
            self._logger.info('OPTA configuration not found')
            return False

    def __is_intf_stats_enabled(self):
        stats = True
        if (self._conf.get('netq-agent') and
            self._conf['netq-agent'].get('stats')):
            stats = (self._conf['netq-agent']['stats'])
            if not isinstance(stats, types.BooleanType):
                if str(stats).lower() in ('true', 'yes', 'on'):
                    stats = True
                else:
                    stats = False
        if not stats:
            self._logger.info('Interface stats collection disabled')
            return False

        self._logger.info('Interface stats collection enabled')
        return True

    def __is_frr_running(self):
        cmd = ['/usr/bin/vtysh', '-c', 'show version']
        if self.__frr_docker_enabled:
            if self.__frr_docker_name:
                cmd = self.__modify_frr_docker_cmd(cmd)
            else:
                return False
        try:
            output = subprocess.check_output(cmd,
                                 stderr=subprocess.STDOUT).splitlines()
            return output[0].startswith('FRRouting ')
        except (subprocess.CalledProcessError, OSError):
            return False

    def __init_frr_docker(self):
        self.__frr_docker_name = None
        self.__frr_docker_conf_name = None
        self.__frr_docker_child_pid = {}
        frr_docker = False

        # we only support FRR docker monitoring
        # on hosts
        platform_str = self.__platform.lower()
        supported = False
        if 'ubuntu' in platform_str:
            supported = True
        elif 'centos' in platform_str:
            supported = True
        elif 'rhel' in platform_str:
            supported = True
        elif 'red hat' in platform_str:
            supported = True

        if (self._conf.get('netq-agent') and
            self._conf['netq-agent'].get('frr_docker')):
            frr_docker = (self._conf['netq-agent']['frr_docker'])
            if not isinstance(frr_docker, types.BooleanType):
                if str(frr_docker).lower() in ('true', 'yes', 'on'):
                    frr_docker = True
                else:
                    frr_docker = False
        if not frr_docker:
            self._logger.info('FRR docker monitoring disabled')
            return False

        if not supported:
            self._logger.info('FRR docker monitoring not supported on %s',
                               platform_str)
            return False

        frr_name = self.__FRR_DOCKER_DEFAULT
        if (self._conf['netq-agent'].get('frr_docker_name')):
            frr_name = str(self._conf['netq-agent']['frr_docker_name'])

        # save the config name
        self.__frr_docker_conf_name = frr_name

        # get the full docker name
        # filter out the k8 POD instances
        self.__get_frr_docker_name()

        self._logger.info('FRR Docker monitoring enabled for %s',
                          self.__frr_docker_conf_name)
        return True

    def _is_chassis_card(self):
        retcode, cmd_out = self.__run_safe_cmd('/usr/lib/cumulus/chassis-info')
        if retcode == 0:
            return True
        return False

    def __get_platform(self):
        """Get the platform name of this device. Skip if its not Cumulus.
        """
        retcode, cmd_out = self.__run_safe_cmd('/usr/bin/platform-detect')
        # We need to revisit this later after 3.3. The string returned for CL
        # and non CL are different.
        if retcode == 0:
            box = '%s, %s' % (Platform.CUMULUS, cmd_out)
        elif os.path.exists('/etc/os-release'):
            with open('/etc/os-release', 'r') as fd:
                name, version = ('Unknown', 'Unknown')
                for line in fd.readlines():
                    if '=' not in line:
                        continue
                    (key, value) = line.strip().split('=')
                    if key.lower() == 'name':
                        name = value.strip('"')
                    if key.lower() == 'version':
                        version = value.strip('"')
                box = '%s, %s, %s' % (Platform.LINUX, name, version)
        return box


    def __get_agent_version(self):
        """Get netq-agent version
        """
        if os.path.exists('/usr/bin/rpm'):
            cmd = '/usr/bin/rpm -qi netq-agent'
        elif os.path.exists('/bin/rpm'):
            cmd = '/bin/rpm -qi netq-agent'
        elif os.path.exists('/usr/bin/dpkg'):
            cmd = '/usr/bin/dpkg -s netq-agent'
        else:
            return 'unknown'

        retcode, cmd_out = self.__run_safe_cmd(cmd)

        if retcode != 0:
            return 'unknown'

        return package.process_agent_version(cmd_out,
                                            self.__platform.lower())

    def __pipe_execute(self, pipeline):
        with self.__redispool.item():
            self._logger.debug('Executing pipeline %s of length %d',
                               id(pipeline), len(pipeline.command_stack))
            pipeline.execute()

    def __modify_frr_docker_cmd(self, cmd):
        dockerbin = self.__get_docker_bin()
        frr_cmd = [dockerbin, 'exec', self.__frr_docker_name]
        frr_cmd.extend(cmd)
        return frr_cmd

    def __update_command_timer(self, info):
        epoch = int(time.time())
        self.__timers.setdefault(epoch + info.period, set())
        self.__timers[epoch + info.period].add(info)

    def __process_command(self, info):
        """This updates a key based on new data from executing the command
        :param info: Command object
        :type info: _Command
        """

        retcode = ServiceStatus.OK
        cmd_out = None

        # For routing commands, check if we need to talk to FRR docker
        routing_daemons = [Daemons.BGPD, Daemons.OSPFD, Daemons.OSPF6D,
                           Daemons.ZEBRA]

        command = info.command
        if info.service in routing_daemons:
            if 'evpn' in info.key and not self.__is_frr_running():
                self.__update_command_timer(info)
                return
            if self.__frr_docker_enabled:
                if self.__frr_docker_name:
                    command = self.__modify_frr_docker_cmd(command)
                else:
                    # no frr docker found
                    self.__update_command_timer(info)
                    return

        # Execute the command:
        if command:
            retcode, cmd_out = self.__run_safe_cmd(command, timeout=info.timeout)

        if retcode:
            info.errcnt += 1
            if info.errcnt < 3:
                # ignore upto 3 consecutive errors
                self.__update_command_timer(info)
                return

            # we are going to let callbacks handle the error

            # FRR docker needs special handling
            # mark the docker name as none so that
            # timer handler will try and find a container
            if info.service in routing_daemons:
                if self.__frr_docker_enabled:
                    self.__frr_docker_name = None
        else:
            info.errcnt = 0

        # Update monitoring status
        status = retcode
        svcs = Services.memmodel()
        svc = svcs.query.get(hostname=HOSTNAME, name=info.service)
        newsvc = Services()

        if svc and info.service != Daemons.MISC and retcode != ServiceStatus.OK:
            svc_fail = self.__has_service_failed(info.service)
            if retcode > ServiceStatus.ERROR or svc_fail:
                status = ServiceStatus.FAIL
            else:
                status = ServiceStatus.ERROR

        if svc and info.service != Daemons.MISC and not info.callback:
            newsvc.copy(svc)
            newsvc.is_monitored = 1
            if newsvc.is_active:
                newsvc.status = status
            else:
                newsvc.status = ServiceStatus.NA
            newsvc.save()

        if not svc and info.always:
            newsvc.name = info.service
            newsvc.is_enabled = True
            newsvc.is_active = True
            newsvc.is_monitored = True
            if retcode == ServiceStatus.OK:
                status = ServiceStatus.OK
            elif retcode > ServiceStatus.ERROR:
                status = ServiceStatus.FAIL
            else:
                status = ServiceStatus.ERROR
            newsvc.status = status
            newsvc.pid = 'n/a'
            newsvc.start_time = 0.0
            newsvc.save()

        if not cmd_out:
            # I'm assuming that the parsers can all catch non-JSON input and
            # parse out an error
            cmd_out = ' '

        is_full_state = self.__is_full_state(info)

        # Don't push the data out unless it has changed
        if cmd_out:
            if info.callback is not None:
                try:
                    retcode = info.callback(
                        cmd_out, status, platform=self.__platform,
                        ports=self.__ports, fullstate=is_full_state)
                except (RedisException, Exception) as ex:  # pylint: disable=broad-except
                    self._logger.exception('Failed to execute command %r %r' %
                                           (info.command, ex))
                if svc and info.service != Daemons.MISC:
                    newsvc.copy(svc)
                    newsvc.is_monitored = 1
                    newsvc.save()
            else:
                newcmd = Command()
                cmdhash = hashlib.md5(cmd_out).digest()
                prev_cmd = self.__prev_cmd.get(info.key, None)
                if prev_cmd is None or prev_cmd[0] != cmdhash:
                    self.__prev_cmd[info.key] = (cmdhash, len(cmd_out))
                    newcmd.key = info.key
                    newcmd.output = cmd_out
                    newcmd.save()

        self.__update_command_timer(info)


    def __is_full_state(self, info):

        if not self.__fullstate_period:
            return False
        if (info.fullstateCnt >= info.fullstate):
            info.fullstateCnt = 0
            return True
        else:
            info.fullstateCnt = info.fullstateCnt + info.period
            return False

    def __process_counters(self):
        """Update Top talkers and such
        Push out counters per port so they can be sorted by redis.
        """

    def __check_ntp_status(self, ntp_sync=''):
        """Update ntp status
        """

        ntp_out = None
        retcode = -1
        ntp_cmd = None
        use_timedatectl = False
        use_chronyc = False 

        if Platform.CUMULUS in self.__platform:
            #Check if VRF is configured
            cmd = '/bin/systemctl show -p MainPID %s*' % RunningService.NTP
            retcode, cmd_out = self.__run_safe_cmd(cmd)
            pid = None
            vrf = None
            if cmd_out:
                lines = cmd_out.splitlines()
                # format should be
                # MainPID=8863
                #
                # if MainPID is 0, then ignore that line
                # and look for other instances
                for line in lines:
                    if '=' not in line:
                        continue
                    attribute, pid = line.split('=')
                    if pid:
                        vrf_cmd = '/usr/bin/vrf task identify %s' % pid
                        retcode, vrf = self.__run_safe_cmd(vrf_cmd)
                        break

            if retcode == 0 and pid is not None:
                if vrf:
                    ntp_cmd = '/usr/bin/vrf task exec %s ntpq -p' % str(vrf)
                else:
                    ntp_cmd = '/usr/bin/ntpq -p'

        else:
            # on non-CL platforms, we can support
            # ntpd, chronyd, timedatectl (we check in that order)
            if 'centos' in self.__platform.lower():
                ntp_svc = CentosRunningService.NTP
                chrony_svc = CentosRunningService.CHRONY
            elif 'rhel' in self.__platform.lower():
                ntp_svc = RhelRunningService.NTP
                chrony_svc = RhelRunningService.CHRONY
            elif 'red hat' in self.__platform.lower():
                ntp_svc = RhelRunningService.NTP
                chrony_svc = RhelRunningService.CHRONY
            else:
                ntp_svc = RunningService.NTP
                #chrony_svc = RunningService.CHRONY
            if os.path.exists('/usr/bin/chronyc'):
                ntp_cmd = '/usr/bin/chronyc sources'
                use_chronyc = True

        if ntp_cmd:
            retcode, ntp_out = self.__run_safe_cmd(ntp_cmd, timeout=15)

        if use_timedatectl:
            return ntp.process_timedatectl(ntp_out)
        elif use_chronyc:
            return ntp.process_chronyc(ntp_out)
        else:
            return ntp.process_ntpq(ntp_out)

    def __check_services(self):
        """Update active/enabled/monitoring services status"""

        if self.__platform == Platform.UNKNOWN:
            return
        base_cumulus_services = []
        hardnode_services = []
        initd_services = []
        initd_svc_cmd = None
        initd_svc_cmd_out = None

        if Platform.CUMULUS in self.__platform:
            base_cumulus_services = [
                RunningService.ARP_REFRESH,
                RunningService.CLAGD,
                RunningService.LLDPD,
                RunningService.MSTPD,
                RunningService.PTMD,
                RunningService.QUAGGA,
                RunningService.FRR,
                RunningService.VXRD,
                RunningService.VXSND,
                RunningService.SMOND,
                RunningService.PWMD,
                RunningService.LEDMGRD,
                RunningService.NETQD,
                RunningService.NETQAGENT,
                RunningService.NETQNOTIFIER,
                RunningService.NEIGHMGRD,
                RunningService.CHASSISD,
                RunningService.CHASSIS_SSH,
            ]
            if Platform.VX not in self.__platform:
                hardnode_services = [
                    RunningService.ACLINIT,
                    RunningService.ACLTOOL,
                    RunningService.LEDMGRD,
                    RunningService.POED,
                    RunningService.PORTWD,
                    RunningService.PWMD,
                    RunningService.SMOND,
                    RunningService.SWITCHD,
                    RunningService.WATCHDOG,
                    RunningService.MLX_SDK
                ]
            base_linux_services = [
                RunningService.NTP,
                RunningService.SSH,
                RunningService.RSYSLOG
            ]
        else:  # Platform.LINUX
            base_cumulus_services = [
                RunningService.NETQD,
                RunningService.NETQAGENT,
                RunningService.NETQNOTIFIER
            ]
            if 'ubuntu' in self.__platform.lower():
                # Non systemd services return UnitFileState=bad
                # Check for UnitFilePreset state
                initd_services = [
                    RunningService.NTP,
                ]

                prop = 'Names,ActiveState,UnitFilePreset,MainPID,ActiveEnterTimestamp'
                initd_svc_cmd = (
                    '%s show -p %s %s' % (
                        '/bin/systemctl', prop, ' '.join(initd_services)))

                base_linux_services = [
                    RunningService.CHRONY,
                    RunningService.SSH,
                    RunningService.RSYSLOG,
                    RunningService.DOCKER,
                    RunningService.LLDPD,
                    RunningService.QUAGGA,  # For routing on host
                    RunningService.FRR  # For routing on host
                ]
            elif 'centos' in self.__platform.lower():
                # Service names are different on different platform
                # e.g ntp service on centos is refered as - ntpd.service
                base_linux_services = [
                    CentosRunningService.NTP,
                    CentosRunningService.CHRONY,
                    RunningService.SSH,
                    RunningService.RSYSLOG,
                    RunningService.DOCKER,
                    RunningService.QUAGGA,  # For routing on host
                    RunningService.FRR  # For routing on host
                ]
            elif 'red hat' in self.__platform.lower():
                base_linux_services = [
                    RhelRunningService.NTP,
                    RhelRunningService.CHRONY,
                    RunningService.SSH,
                    RunningService.RSYSLOG,
                    RunningService.DOCKER,
                    RunningService.QUAGGA,  # For routing on host
                    RunningService.FRR  # For routing on host
                ]
            elif 'rhel' in self.__platform.lower():
                base_linux_services = [
                    RhelRunningService.NTP,
                    RhelRunningService.CHRONY,
                    RunningService.SSH,
                    RunningService.RSYSLOG,
                    RunningService.DOCKER,
                    RunningService.QUAGGA,  # For routing on host
                    RunningService.FRR  # For routing on host
                ]
            else:
                base_linux_services = [
                    RunningService.NTP,
                    RunningService.SSH,
                    RunningService.RSYSLOG,
                    RunningService.DOCKER,
                    RunningService.QUAGGA,  # For routing on host
                    RunningService.FRR  # For routing on host
                ]

        all_svcs = ' '.join(base_cumulus_services +
                            base_linux_services +
                            hardnode_services)

        if self.__frr_docker_enabled:
            # make sure we remove FRR from systemctl request
            try:
                all_svcs = all_svcs.replace(RunningService.FRR, '')
                all_svcs = all_svcs.replace(RunningService.QUAGGA, '')
            except Exception:
                pass

        if not os.path.exists('/bin/systemctl'):
            self._logger.error('Non systemctl systems not supported')
            return
        prop = 'Names,ActiveState,UnitFileState,MainPID,ActiveEnterTimestamp'
        cmd = '%s show -p %s %s *@*' % ('/bin/systemctl', prop, all_svcs)
        retcode, cmd_out = self.__run_safe_cmd(cmd)

        if initd_svc_cmd:
            initd_svc_retcode, initd_svc_cmd_out = self.__run_safe_cmd(initd_svc_cmd)
            if initd_svc_retcode != 0:
                initd_svc_cmd_out = None

        if retcode == 0 and cmd_out:
            if initd_svc_cmd_out:
                cmd_out = cmd_out + '\n' + initd_svc_cmd_out
            try:
                systemctl.process_systemctl(cmd_out)
            except Exception as ex:  # pylint: disable=broad-except
                self._logger.info('Failed to process systemctl output. %s', ex)

    def __update_link_masters(self, master_ifindex, master_ifname, master_kind):
        '''Update the master ifindex for each of the saved links'''

        if master_ifindex not in self.__to_update_master_links:
            return

        for ifname in self.__to_update_master_links[master_ifindex]:
            m_link = Link.memmodel()
            old_entry = m_link.query.get(hostname=HOSTNAME, ifname=ifname)
            if old_entry:
                if (old_entry.active and (old_entry.master ==
                                          str(master_ifindex))):
                    link = Link()
                    link.copy(old_entry)
                    link.master = master_ifname
                    if master_kind == LinkType.VRF:
                        link.vrf = master_ifname
                    link.timestamp = old_entry.timestamp
                    del_old_entry = Link()
                    del_old_entry.copy(old_entry)
                    del_old_entry.delete()
                    link.save()

        self.__to_update_master_links.pop(master_ifindex, None)

    def __update_server_info(self):
        """ Update redis server pid
            check for connected_slaves
            if mismatch detected, set AGENT_PAUSE=True
        """
        try:
            new_server_info = server_info()
        except Exception as ex:
            self.__server_info_fail_cnt = self.__server_info_fail_cnt + 1
            self._logger.info('Could not get Redis server info (fail cnt %d). Error: %s',
                                self.__server_info_fail_cnt, ex)
            if self.__server_info_fail_cnt > self.__MAX_SERVER_INFO_FAIL_CNT:
                self._logger.info('Redis server info failed after %d attempts',
                                  self.__server_info_fail_cnt)
                #self.__pause_agent()
                return False
            return True

        new_role = new_server_info.get("role", None)
        new_connected_slaves = new_server_info.get("connected_slaves", 0)

        if new_role is None:
            self._logger.info('Redis role could not be determined')
            return False

        if new_role != 'master':
            self._logger.info('Redis server detected new master %s:%s',
                              new_server_info.get("master_host", None),
                              new_server_info.get("master_port", None))
            #self.__pause_agent()
            return False

        if is_backend_sentinel_aware(self._conf[ConfKw.BACKEND]):
            if new_connected_slaves == 0:
                if not self.__AGENT_PAUSE_FIRST_RUN:
                    self._logger.info('Redis master Detected but no slaves')
                #self.__pause_agent()
                return False

        if (not self.__server_info):
            self.__server_info = new_server_info
            self._logger.info('Redis server initialized run_id [%s]',
                              self.__server_info.get("run_id", None))
            self.__server_info_fail_cnt = 0
            return True

        if (self.__server_info.get("run_id", None) !=
                new_server_info.get("run_id", None)):
            self._logger.info('Redis server run_id old [%s] != new [%s]',
                              self.__server_info.get("run_id", None),
                              new_server_info.get("run_id", None))
            # if have HA setup, ignore run_id changes
            if not is_backend_sentinel_aware(self._conf[ConfKw.BACKEND]):
                # if agent already in paused state - ignore
                if self.__AGENT_PAUSE is False:
                    # clear info - so we can start afresh
                    self.__server_info = {}
                    #self.__pause_agent()
                    return False

        # assign new server info
        self.__server_info = new_server_info
        if self.__server_info_fail_cnt:
            self._logger.info('Redis server info updated run_id [%s]',
                              self.__server_info.get("run_id", None))
            self.__server_info_fail_cnt = 0
        return True

    def __cleanup_nlmonitor_thread(self):

        if self.__nlmonitor_gt is not None:
            self._logger.info('Terminating netlink monitor thread')
            eventlet.kill(self.__nlmonitor_gt, eventlet.StopServe)
            self.__nlmonitor_gt = None

    def __flush_obj_cache(self, nl_only=False):
        try:
            for cln, cls in inspect.getmembers(netq_lib.orm.redisdb.models):
                if cln in self.__NON_CLS_MODELS:
                    continue
                if nl_only and cln not in self.__NL_CLS_MODELS:
                    continue
                if inspect.isclass(cls) and hasattr(cls, 'memmodel'):
                    mcls = cls.memmodel()
                    if mcls:
                        mcls.flush()
        except (RedisException, Exception) as ex:
            self._logger.info('Flush failed. Error: %s', ex)

    def __cleanup_threads(self):

        self.__cleanup_nlmonitor_thread()

        # Flush the pipeline
        self._logger.debug('Flushing the pipeline')
        for entry in list(self.__redisthreads):
            entry.kill()
        self.__redisthreads = set()

        self.__flush_obj_cache()

    def __delete_netlink_from_redis(self):
        """ Delete netlink keys
        """
        self._logger.info('Deleting netlink keys from REDIS')
        try:
            for cln, cls in inspect.getmembers(netq_lib.orm.redisdb.models):
                if cln not in self.__NON_CLS_MODELS:
                    continue
                if not inspect.isclass(cls):
                    continue
                try:
                    if hasattr(cls, 'key_fmt'):
                        key = cls.key_fmt()
                        if not len(key):
                            continue
                    else:
                        continue
                    if hasattr(cls, 'query'):
                        cls.query.delete(hostname=HOSTNAME, purge=False)
                except Exception:
                    continue
        except (RedisException, Exception):
            # ignore all exceptions
            pass

        return


    @FullState("Link")
    def __netlink_get_all_links(self):
        """ Get netlink link info
        """
        self._pool.spawn(self.__nlmonitor.get_all_links).wait()
        self.__nlmonitor.set_mcast_group('link')

    @FullState('Address')
    def __netlink_get_all_addresses(self):
        """ Get netlink addr
        """
        self._pool.spawn(self.__nlmonitor.get_all_addresses).wait()
        self.__nlmonitor.set_mcast_group('addr')

    @FullState('Neighbor')
    def __netlink_get_all_neighbors(self):
        """ Get netlink neigh
        """
        self._pool.spawn(self.__nlmonitor.get_all_neighbors).wait()
        self.__nlmonitor.set_mcast_group('neigh')

    @FullState('Routes')
    def __netlink_get_all_routes(self):
        """ Get netlink routes
        """
        self._pool.spawn(self.__nlmonitor.get_all_routes).wait()
        self.__nlmonitor.set_mcast_group('routes')

    @FullState('MacFdb')
    def __netlink_get_all_macs(self):
        """ Get netlink mac
        neigh mcast group should already be set
        """
        self._pool.spawn(self.__nlmonitor.get_all_macs).wait()

    @FullState('Netconf')
    def __netlink_get_all_netconf(self):
        """ Get netlink netconf
        """
        self._pool.spawn(self.__nlmonitor.get_all_netconf).wait()
        self.__nlmonitor.set_mcast_group('netconf')

    def __reinitialize_nl(self):
        """ Reinitializing netlink subsystem
        """
        self._logger.info('Netlink - (Re)initializing (%d)', self.__nl_poll_retry)

        self.__cleanup_nlmonitor_thread()

        # Flush the netlink cache
        self.__nlmonitor.reset()

        if self.__redis_enabled:
            self.__delete_netlink_from_redis()

        if self.__opta_enabled:
            self.__flush_obj_cache()

        # Rebind netlink socket
        self._logger.info('Binding netlink socket')
        try:
            self.__nlmonitor.bind()
        except RuntimeError as ex:
            self._logger.warn('Fail Binding netlink socket %s', ex)
            self.__NETLINK_RESTART = True
            self.__nlmonitor.socket.close()
            os.kill(self.__grpc_stream_process.pid, 9)
            return

        self.__nlmonitor_gt = (
                    self._pool.spawn(self._serve,
                    self.__nlmonitor.socket,
                    self.__nlmonitor.handle_netlink_msg,
                    bufsize=netlink.Netlink.NLSOCK_BYTES)
        )
        self.__nlmonitor_gt.link(self.__stop_monitor_checker)

        # Start the netlink handler threads
        intf_gt, nlevent_gt = self.__nlmonitor.run()
        intf_gt.link(self._stop_checker)
        nlevent_gt.link(self._stop_checker)

        # Repopulating netlink
        self.__ifname_by_index = {}
        self.__vxlan_vlan_map = {}
        try:
            self.__netlink_get_all_links()
            self.__netlink_get_all_addresses()
            self.__netlink_get_all_routes()
            self.__netlink_get_all_neighbors()
            self.__netlink_get_all_macs()
            self.__netlink_get_all_netconf()
        except greenlet.GreenletExit:  # pylint: disable=no-member
            self._logger.info("Greenlet exit called")
            self.__nlmonitor.reset()
            if self.__nlmonitor_gt:
                self.__nlmonitor_gt.kill()
            pass
        except (RedisException, Exception) as ex:  # pylint: disable=broad-except
            self._logger.info('netlink get_all_links failed %s', ex)
            if ex.errno == errno.ENOBUFS:
                self.__NETLINK_RESTART = True
            else:
                self.__pause_agent()
            return

        self.__NETLINK_INIT_DONE = True

        self.__send_netlink_fullstate()

        self._logger.info('netlink init done')

    def __get_mem_objects(self, objectname, generator=True):
        try:
            mcls = eval(objectname).memmodel()
        except Exception:
            self._logger.error("Unable to find obj {}".format(objectname))
            return None
        if generator:
            return mcls.query.all()
        else:
            all_objs = [obj for obj in mcls.query.all()]
        return all_objs


    def __send_netlink_fullstate(self):
        message_types = ['Link', 'Address', 'Netconf', 'Route', 'Neighbor', 'MacFdb', 'VxlanRemoteDest']
        for message_type in message_types:
            for obj in self.__get_mem_objects(message_type):
                self.full_state_object.push_message_queue(obj)
            self.full_state_object.flush_fullstate(message_type)


    def __pause_agent(self):
        self._logger.info('Agent is Paused')
        agent_stats_obj = AgentStatsMon.get_instance()
        agent_stats_obj.agent_pause_count += 1
        self.__AGENT_PAUSE = True

    def __init_netlink_thread(self):
        if self.__nlinit_gt:
            self._logger.info("killing netlink thread")
            self.__nlinit_gt.kill()
            self.__nlinit_gt = None

        self.__NETLINK_INIT_DONE = False
        self.__nlinit_gt = _Thread.spawn(int(time.time()),
                                         self._pool,
                                         self.__reinitialize_nl)
        self.__nlinit_gt.link(self.__stop_thread_checker)
        self.__redisthreads.add(self.__nlinit_gt)
        self.__NETLINK_RESTART = False

    def __redis_connect_init(self):
        try:
            server, port = set_connection_settings(self._conf[ConfKw.BACKEND],
                                    agent=True, logger=self._logger)
            if not self.__AGENT_PAUSE_FIRST_RUN:
                self._logger.info('Redis server connect OK {}:{}'.format(server, port))
        except Exception:
            if not self.__AGENT_PAUSE_FIRST_RUN:
                self._logger.info('Redis server connect failed')
            self.__AGENT_PAUSE_FIRST_RUN = True
            return False

        try:
            ping_server()
            if not self.__AGENT_PAUSE_FIRST_RUN:
                self._logger.info('Redis Ping to server succeeded.')
        except Exception as ex:
            if not self.__AGENT_PAUSE_FIRST_RUN:
                self._logger.info('Redis Ping failed to server. Error: %s', ex)
            # use this for limiting logs
            self.__AGENT_PAUSE_FIRST_RUN = True
            # in non-HA init the server-info
            # in HA keep the server-info to perform connected_slave checks
            if not is_backend_sentinel_aware(self._conf[ConfKw.BACKEND]):
                self.__server_info = {}
            return False

        # check server info
        server_updated = self.__update_server_info()

        if not server_updated:
            if not self.__AGENT_PAUSE_FIRST_RUN:
                self._logger.info('Could not update server info')
            # use this for limiting logs
            self.__AGENT_PAUSE_FIRST_RUN = True
            return False

        return True


    def __get_grpc_connection_state(self):
        if not NetQPriorityQueue.bp_PQ.is_empty():
            for priority, message_type, state, msg in NetQPriorityQueue.bp_PQ.get_buffer(0):
                self.__grpc_state = state
                self._logger.info("Agent : GRPC Connectivity state {}".format(state))
        return self.__grpc_state

    def __reinitialize_db(self):
        """ Reinitializing the database. This is called
        a. on startup
        b. when pipeline execute fails
        c. the bridge monitor or netlink monitor greenthread crash
        """

        with self.__reinitpool.item():
            # Check if hostname is still 'Cumulus'
            if HOSTNAME == 'cumulus':
                if self.__prev_hostname == 'unknown':
                    self._logger.info("Agent paused - hostname is 'cumulus'")
                    self.__prev_hostname = HOSTNAME
                return

            self.__hostname = HOSTNAME
            self.__prev_hostname = 'unknown'

            if not self.__AGENT_PAUSE_FIRST_RUN:
                self._logger.info('Agent - (re)initializing on %s', HOSTNAME)

            self.__cleanup_threads()

            #Terminate docker monitor
            self.__docker.halt()

            #Terminate Kubernetes monitor
            self.__kubernetes.halt()

            # see if we can connect with redis
            if self.__redis_enabled:
                self.__redis_connect_init()

            if not self.__get_grpc_connection_state():
                self.__pause_agent()
                return
            else:
                self.__AGENT_PAUSE = False

            if (self.__opta_enabled and
                (NetQPriorityQueue.PQ.is_full() or
                 not NetQPriorityQueue.bp_PQ.is_empty())):
                if NetQPriorityQueue.PQ.is_full():
                    rsn = "GRPC priority Q FULL"
                    self.__grpc_q_full = True
                elif not NetQPriorityQueue.bp_PQ.is_empty():
                    rsn = "GRPC backpressure"
                    NetQPriorityQueue.bp_PQ.empty_queues()
                if not self.__AGENT_PAUSE_FIRST_RUN:
                    self._logger.info("Agent pause due to %s", rsn)
                # use this for limiting logs
                self.__AGENT_PAUSE_FIRST_RUN = True
                return
            elif self.__grpc_q_full:
                self._logger.info("Agent grpc priority Q RESUME len %d",
                    NetQPriorityQueue.PQ.len(1))
                self.__grpc_q_full = False

            # redis ping , server info checks passed
            self.__AGENT_PAUSE_FIRST_RUN = False

            self._logger.info('Reinitializing the database')

            if self.__redis_enabled:
                new_pipeline()

            #Flush docker keys from database
            # self.__docker.flushkeys()

            # kick off netlink init thread
            self.__nl_poll_retry = 0
            self.__init_netlink_thread()

            # update platform info like mem, cpu etc
            self.__update_platform_info(False)
            
            #Run Docker monitor
            self.__docker.start()

            #Run Kubernetes monitor
            self.__kubernetes.start()

            # looks good!
            self.__AGENT_PAUSE = False

    def __rx_rtm_newnetconf(self, info):
        self._logger.debug('RX RTM_NEWNETCONF for ip%s ifindex %s: %d',
                           'v6' if info.is_ipv6 else 'v4', info.ifindex,
                           info.forwarding)
        netconf = Netconf()
        NetlinkCopy.copy_netconf(netconf, info, self.__ifname_by_index)
        if netconf.ifname == 'None':
            return info.ifindex
        netconf.save()

        return info.ifindex

    def __rx_rtm_newaddr(self, info):
        """Adds a new address to the DB.
        :param info: address object
        :type info: netlink.Address
        """
        self._logger.debug('RX RTM_NEWADDR for ip_address %s, ifindex %s',
                          '/'.join((info.prefix, str(info.mask))),
                          info.ifindex)
        addr = Address()
        NetlinkCopy.copy_address(addr, info, self.__ifname_by_index)
        table = self.__link_table_map.get(info.ifindex, RouteTable.DEFAULT)
        addr.vrf = self.__link_vrf_map.get(table, 'default')
        self._logger.debug('RX RTM_NEWADDR for %s, ifindex %s, VRF %s, to DB',
                          '/'.join((info.prefix, str(info.mask))), info.ifindex,
                          addr.vrf)
        if addr.ifname == 'None':
            # save this address - not yet ready to go into Db
            # ifindex can have multiple ips (v4, v6)
            if not self.__addr_ifindex_map.get(info.ifindex):
                self.__addr_ifindex_map[info.ifindex] = {}
            self.__addr_ifindex_map[info.ifindex][info.prefix] = addr
            return info.ifindex
        addr.save()

        return info.ifindex

    def __rx_rtm_deladdr(self, info):
        """Deletes an address from the DB.
        :param info: address object
        :type info: netlink.Address
        """
        self._logger.debug('RX RTM_DELADDR for ip_address %s, ifindex %s',
                          '/'.join((info.prefix, str(info.mask))),
                          info.ifindex)
        addr = Address()
        NetlinkCopy.copy_address(addr, info, self.__ifname_by_index)
        table = self.__link_table_map.get(info.ifindex, RouteTable.DEFAULT)
        addr.vrf = self.__link_vrf_map.get(table, 'default')
        if self.__addr_ifindex_map.get(info.ifindex):
            self.__addr_ifindex_map[info.ifindex].pop(info.prefix)
        self._logger.debug('Deleting address %r from DB', addr)
        addr.delete()
        return info.ifindex

    @staticmethod
    def set_link_kind(link, info):
        if link.kind == '':
            if info.ifname == 'lo':
                link.kind = LinkType.LOOPBACK
            elif (info.ifname.startswith('eth') or
                    info.ifname.startswith('usb')):
                link.kind = LinkType.ETH
            elif info.ifname == 'swid0_eth':
                # Melllanox chip internal port
                link.kind = LinkType.ETH
            else:
                link.kind = LinkType.SWP

        if (link.kind == LinkType.BCM or
            link.kind == LinkType.MLX or
                (link.kind == LinkType.TUN and info.ifname.startswith('swp'))):
            link.kind = LinkType.SWP
        return link.kind

    def __rx_rtm_newlink(self, info):
        """Adds a new link to the DB.
        :param info: link object
        :type info: netlink.Link
        """
        self._logger.debug('RX RTM_NEWLINK for ifname %s, admin_state %s, '
                          'oper_state %s', info.ifname, info.admin_state,
                          info.oper_state)

        del_master_idx_entry = False
        link = Link()
        old_entry = None

        self.__ifname_by_index[info.ifindex] = info.ifname
        if info.kind == LinkType.VRF:
            self.__link_vrf_map[info.rt_table_id] = info.ifname

        self.__link_table_map[info.ifindex] = info.rt_table_id

        m_link = Link.memmodel()
        old_entry = m_link.query.get(hostname=HOSTNAME,
                                     ifname=info.ifname)

        if info.family == socket.AF_BRIDGE:
            if old_entry:
                link.copy(old_entry)
            else:
                # Being bold here. Discard any updates we get before we
                # determine link type. Assuming we can get it all back.
                self._logger.info('Ignored AF_BRIDGE link upd8 for %s, no '
                                  'cache', info.ifname)
                return info.ifindex
        else:
            # for a bridge port, we can't assume an update always comes in an
            # AF_UNSPEC message followed by an AF_BRIDGE message, need to
            # carry over the link object attributes if it exists
            if old_entry:
                link.copy(old_entry)

            NetlinkCopy.copy_link(link, info)

        # Some of the fields have to be always copied over
        NetlinkCopy.copy_link_always(link, info)

        if info.stp_state != StpPortState.UNINIT:
            link.stp_state = info.stp_state
        elif old_entry and old_entry.stp_state != StpPortState.UNINIT:
            link.stp_state = old_entry.stp_state
        else:
            link.stp_state = StpPortState.FORWARDING

        if info.master_ifindex:
            link.master = self.__ifname_by_index.get(info.master_ifindex, '')
            if not link.master:
                link.master = str(info.master_ifindex)
                if info.master_ifindex not in self.__to_update_master_links:
                    self.__to_update_master_links[info.master_ifindex] = []
                self.__to_update_master_links[info.master_ifindex].append(
                    info.ifname)
        else:
            # master_ifindex is not present
            # could be bridge port or bridge notification AF_BRIDGE
            old_master = link.master
            link.master = info.ifname

            # need to reset bridge port attributes if link is no longer
            # a bridge port
            if info.kind != LinkType.BRIDGE and \
               (old_master and old_master != link.master):
                link.access_vlan = 0
                link.vlans = ''

        # Forget the past with the old master, and go live with the new
        if old_entry and link.master != old_entry.master:
            del_master_idx_entry = True
            if old_entry.master.isdigit():
                old_master = int(old_entry.master)
                if old_master in self.__to_update_master_links:
                    try:
                        self.__to_update_master_links[old_master].remove(
                            info.ifname)
                    except ValueError:
                        pass

        # Update all slaves who hadn't resolved their old master
        # ifindex to name
        self.__update_link_masters(info.ifindex, info.ifname, info.kind)
        self.set_link_kind(link, info)

        link.managed = True

        if info.parent_if:
            link.parent_if = self.__ifname_by_index.get(info.parent_if,
                                                        str(info.parent_if))
        else:
            link.parent_if = info.ifname

        if info.kind == LinkType.VLAN:
            link.access_vlan = info.vni

        if info.kind == LinkType.MACVLAN:
            m_link = Link.memmodel()
            for m_lentry in list(m_link.query.filter(hostname=HOSTNAME,
                                                     ifname=link.parent_if)):
                link.access_vlan = m_lentry.access_vlan
                break

        # When the VLAN->VNI mapping happens, the kind is missing and so
        # the block below will not be executed if we use info.kind. We
        # have to rely on the cached link.kind
        if link.kind == LinkType.VXLAN:
            # We use this cached value to handle MacFdb updates
            self.__vxlan_vlan_map[info.ifname] = {'vlan': link.access_vlan,
                                                  'vni': link.vni}
            if info.ifname not in self.__link_kind_map:
                self.__link_kind_map[info.ifname] = {}
            self.__link_kind_map[info.ifname]['vni'] = link.vni

        # We store the name of the master interface with an interface key.
        # However, the kernel merely supplies the ifindex leaving it an
        # exercise for the user to derive the name associated with that index.
        # Sometimes, we get the slave interface's info before we receive the
        # master's, and we don't have a way to derive the ifname for the master
        # In such a scenario, we create the entry with the ifindex with the
        # hope that we'll resolve it soon after when we receive another nlink
        # update. When that event update happens, we want to delete the old
        # entry. Thats what the following code does.
        if del_master_idx_entry and old_entry:
            del_old_entry = Link()
            del_old_entry.copy(old_entry)
            self._logger.debug('Deleting ifidx master for %s' % info.ifname)
            if del_old_entry.objid:
                # Delete associated description too
                descr = Description()
                descr.objtype = Link.__name__
                descr.descrid = del_old_entry.objid
                descr.delete()
            del_old_entry.delete()
        elif (old_entry and old_entry.objid and not info.ifalias and
                info.family != socket.AF_BRIDGE):
            descr = Description()
            descr.objtype = old_entry.__class__.__name__
            descr.descrid = old_entry.objid
            descr.delete()

        self.__link_master_map[info.ifname] = link.master
        if link.kind != LinkType.VRF:
            link.vrf = self.__link_vrf_map.get(info.rt_table_id, 'default')

        # If there are Addresses that did not get ifName mapped
        # map it now
        if self.__addr_ifindex_map.get(info.ifindex):
            for prefix in self.__addr_ifindex_map[info.ifindex]:
                addr = self.__addr_ifindex_map[info.ifindex][prefix]
                addr.ifname = info.ifname
                addr.save()

        # If the VRF associated with this device changes, rejig the addr
        # associated to carry the right VRF.
        m_address = Address.memmodel()
        if old_entry and old_entry.vrf != link.vrf:
            for m_aentry in list(m_address.query.filter(hostname=HOSTNAME,
                                                        ifname=info.ifname,
                                                        vrf=old_entry.vrf)):
                old_aentry = Address()
                old_aentry.copy(m_aentry)
                old_aentry.delete()
                new_aentry = Address()
                new_aentry.copy(m_aentry)
                new_aentry.vrf = link.vrf
                new_aentry.save()

        self._logger.debug('Adding new link %r to DB', link)
        if info.ifalias:
            descr = Description()
            descr.timestamp = link.timestamp
            descr.objtype = link.__class__.__name__
            descr.descrid = link.get_objid()
            descr.description = info.ifalias
            link.objid = descr.descrid
            descr.save()

        link.save()
        if link.kind == LinkType.SWP or link.kind == LinkType.ETH:
            self.__ports.add(link.ifname)
        return info.ifindex

    def __rx_rtm_dellink(self, info):
        """Deletes a link from the DB.
        :param info: link object
        :type info: netlink.Link
        """
        self._logger.debug('RX RTM_DELLINK for ifname %s, admin_state %s, '
                          'oper_state %s', info.ifname, info.admin_state,
                          info.oper_state)
        link = Link()
        NetlinkCopy.copy_link(link, info)
        link.master = self.__link_master_map.get(info.ifname, str(info.ifname))
        self.__to_update_master_links.pop(info.ifindex, None)
        self.set_link_kind(link, info)
        self._logger.debug('Deleting link %r from DB', link)
        # If there are Routes that use this interface as nexthop
        # delete them as well
        # no guarantees that netlink will be generated for those
        # routes
        mcls = Route.memmodel()
        entries = mcls.query.filter()
        for entry in entries:
            to_save = False
            for nh in entry.nexthops:
                if nh[1] == link.ifname:
                    entry.nexthops.remove(nh)
                    to_save = True
            if to_save:
                rt = Route()
                rt.copy(entry)
                if not len(rt.nexthops):
                    rt.delete()
                else:
                    rt.save()

        # If there are Addresses that did not get ifName mapped
        # delete them as well
        if self.__addr_ifindex_map.get(info.ifindex):
            self.__addr_ifindex_map.pop(info.ifindex)
        descr = Description()
        descr.objtype = link.__class__.__name__
        descr.descrid = link.get_objid()
        descr.delete()
        link.delete()
        if link.kind == LinkType.SWP or link.kind == LinkType.ETH:
            self.__ports.discard(link.ifname)
        return info.ifindex

    def __rx_rtm_newneigh(self, info):
        """Adds a new neighbor to the DB.
        Neighbors in the kernel go through a lot of state transitions that
        we are currently not interested in tracking.  Only update redis if a
        neighbor is new...ie ignore all of the RTM_NEWNEIGH messages
        generated from the state transitions
        :param info: neighbor object
        :type info: netlink.Neighbor
        """
        self._logger.debug('RX RTM_NEWNEIGH for ip_address %s, ifindex %s',
                           info.ip_address, info.ifindex)
        if info.family == socket.AF_BRIDGE:
            neighbor = MacFdb()
            self.__nlmonitor.stats.increment(netlink.NetlinkStat.RTM_NEWFDB,
                                             1)
            NetlinkCopy.copy_macfdb(neighbor, info, self.__ifname_by_index)
            if neighbor.dst:
                vinfo = self.__vxlan_vlan_map.get(neighbor.nexthop)
                if vinfo:
                    neighbor.vlan = int(vinfo['vlan'])
                    # get the replication list for the vni
                    if neighbor.mac_address == '00:00:00:00:00:00':
                        rdst = VxlanRemoteDest()
                        rdst.vni = int(vinfo['vni'])
                        rdst.rdst = neighbor.dst
                        rdst.save()
                else:
                    neighbor.vlan = -1

            else:
                if self.__link_kind_map.get(neighbor.nexthop, None):
                    # This is the second update to the same remote MAC
                    # but this time from the bridge, without the remote vtep
                    # address. Ignore it.
                    self._logger.debug('Ign new neighbor %r to DB', neighbor)
                    return info.ifindex
        else:
            neighbor = Neighbor()  # pylint: disable=redefined-variable-type
            NetlinkCopy.copy_neighbor(neighbor, info, self.__ifname_by_index)
            table = self.__link_table_map.get(info.ifindex, RouteTable.DEFAULT)
            neighbor.vrf = self.__link_vrf_map.get(table, 'default')
            if neighbor.vrf == neighbor.ifname:
                # ignore nbr updates that happen on the vrf device
                return info.ifindex
        if info.state == NeighborState.UPDATE:
            self._logger.debug('Adding new neighbor %r to DB', neighbor)
            neighbor.save()
        elif info.state == NeighborState.DELETE:
            # In neighbor delete, the MAC address is not provided. So get
            # the mac address from the entry in memory
            mcls = Neighbor.memmodel()
            mentry = mcls.query.get(hostname=HOSTNAME,
                                    ifname=neighbor.ifname,
                                    ip_address=neighbor.ip_address,
                                    is_ipv6=neighbor.is_ipv6,
                                    vrf=neighbor.vrf)
            if mentry:
                neighbor.mac_address = mentry.mac_address
                self._logger.debug('Deleting neighbor %r from DB', neighbor)
                neighbor.delete()
            else:
                # We cannot process the delete of this entry because we don't
                # have the mac address
                self._logger.debug('Unable to delete neighbor %s', neighbor)
        return info.ifindex

    def __rx_rtm_delneigh(self, info):
        """Deletes a neighbor from the DB.
        :param info: neighbor object
        :type info: netlink.Neighbor
        """
        self._logger.debug('RX RTM_DELNEIGH for ip_address %s, ifindex %s',
                           info.ip_address, info.ifindex)
        if info.family == socket.AF_BRIDGE:
            neighbor = MacFdb()
            self.__nlmonitor.stats.increment(netlink.NetlinkStat.RTM_DELFDB,
                                             1)
            NetlinkCopy.copy_macfdb(neighbor, info, self.__ifname_by_index)
            if neighbor.dst and neighbor.mac_address == '00:00:00:00:00:00':
                vinfo = self.__vxlan_vlan_map.get(neighbor.nexthop)
                rdst = None
                if vinfo:
                    vnid = int(vinfo['vni'])
                    rdsts = VxlanRemoteDest.memmodel()
                    rdst = rdsts.query.get(hostname=HOSTNAME, vni=vnid,
                                       rdst=neighbor.dst)
                if rdst:
                    old_rdst = VxlanRemoteDest()
                    old_rdst.copy(rdst)
                    old_rdst.delete()
        else:
            neighbor = Neighbor()  # pylint: disable=redefined-variable-type
            NetlinkCopy.copy_neighbor(neighbor, info, self.__ifname_by_index)
            table = self.__link_table_map.get(info.ifindex, RouteTable.DEFAULT)
            neighbor.vrf = self.__link_vrf_map.get(table, 'default')
        self._logger.debug('Deleting neighbor %r from DB', neighbor)
        neighbor.delete()
        return info.ifindex

    def __rx_rtm_newroute(self, info):
        """Adds a new route to the DB.
        :param info: route object
        :type info: netlink.Route
        """
        # Skip redistribute neighbor routes in table 10
        if (info.table == self.__REDISTRIBUTE_NBR_TABLE_ID):
            self._logger.debug('RX RTM_NEWROUTE ignore ip_address %s in redist nbr %s',
                          info.ip_address, info.table)
            return info.ifindex

        self._logger.debug('RX RTM_NEWROUTE for ip_address %s, nexthops %s',
                          info.ip_address, info.nexthops)

        if info.table is None or info.ifindex is None:
            #
            # This is a temporary fix to handle MPLS label path
            # NLManager does not ssupport parsing MPLS labeled multipath
            # resulting in invalid nexthop/table info
            #
            self._logger.info('RTM_NEWROUTE invalid table-id:%r or \
                ifindex:%r for %s, nexthops %s',
                info.table, info.ifindex, info.ip_address, info.nexthops)
            return info.ifindex

        route = Route()
        NetlinkCopy.copy_route(route, info, self.__ifname_by_index,
                               self.__rt_protos_map)
        if (route.rt_table_id == RouteTable.LOCAL and route.route_type != 3):
            # In case of VRFs, all local routes are shown as being in the VRF
            # table whereas for the default VRF, the local route (essentially
            # the interface address itself) is shown as being in table local.
            # This prevents us from efficiently using redis key structure to
            # filter entries.
            route.rt_table_id = RouteTable.DEFAULT
        route.vrf = self.__link_vrf_map.get(route.rt_table_id, 'default')

        # ignore certain route pfx
        skip_ipv6_addr = {'::1/128', 'ff00::/8'}
        if route.is_ipv6 and route.prefix in skip_ipv6_addr:
            return info.ifindex

        if route.is_ipv6:
            mcls = Route.memmodel()
            entries = mcls.query.filter(is_ipv6=route.is_ipv6, vrf=route.vrf,
                                    prefix=route.prefix, origin=route.origin)
            # check if lower metric detected
            for entry in entries:
                if route.priority > entry.priority:
                    # ignore higher metric
                    self._logger.debug('Ignoring route priority new %d > old %d',
                        route.priority, entry.priority)
                    return info.ifindex

        self._logger.debug('Adding new route %r in VRF %s to DB', route,
                           route.vrf)
        route.save()
        return info.ifindex

    def __rx_rtm_delroute(self, info):
        """Delete a route from the DB.
        :param info: route object
        :type info: netlink.Route
        """
        self._logger.debug('RX RTM_DELROUTE for ip_address %s, nexthops %s',
                           info.ip_address, info.nexthops)
        route = Route()
        NetlinkCopy.copy_route(route, info, self.__ifname_by_index,
                               self.__rt_protos_map)
        if (route.rt_table_id == RouteTable.LOCAL and route.route_type != 3):
            # In case of VRFs, all local routes are shown as being in the VRF
            # table whereas for the default VRF, the local route (essentially
            # the interface address itself) is shown as being in table local.
            # This prevents us from efficiently using redis key structure to
            # filter entries.
            route.rt_table_id = RouteTable.DEFAULT
        route.vrf = self.__link_vrf_map.get(route.rt_table_id, 'default')
        self._logger.debug('Deleting route %r in VRF %s from DB', route,
                           route.vrf)
        route.delete()
        return info.ifindex

    def __stop_command_checker(self, green_thread, identifier, command):
        try:
            self.__command_buffer[identifier], _ = green_thread.wait()
        except greenlet.GreenletExit:
            pass
        except (RedisException, Exception) as ex:  # pylint: disable=broad-except
            self._logger.info('Failed to execute command %s Error: %s', command, ex)

    def __stop_monitor_checker(self, green_thread):
        try:
            green_thread.wait()
        except greenlet.GreenletExit:  # pylint: disable=no-member
            pass
        except (RedisException, Exception) as ex:  # pylint: disable=broad-except
            if self.__nlmonitor_gt == green_thread:
                self.__nlmonitor_gt = None
                self._logger.info('Netlink monitor thread terminated unexpectedly. Error: %s', ex)
                if ex.errno == errno.ENOBUFS:
                    self.__NETLINK_RESTART = True
                else:
                    self.__pause_agent()
            else:
                self._logger.exception('Monitor thread terminated unexpectedly. Error: %s', ex)
                self.__pause_agent()

    def __stop_thread_checker(self, green_thread):
        """ Propagates exceptions to the run green thread.
        """
        entry = next((thread for thread in self.__redisthreads
                      if thread.green_thread == green_thread), None)
        if entry is not None:
            self.__redisthreads.remove(entry)
            if entry == self.__heartbeat_gt:
                self.__heartbeat_gt = None
            elif entry == self.__nlinit_gt:
                self.__nlinit_gt = None
        try:
            green_thread.wait()
        except greenlet.GreenletExit:  # pylint: disable=no-member
            pass
        except (RedisException, Exception) as ex:
            if entry is not None:
                if entry.pipeline is not None:
                    self._logger.info('Failed to execute PIPELINE %s. Error: %s',
                                      id(entry.pipeline), ex)
                elif entry == self.__heartbeat_gt:
                    self._logger.info('Failed to send heartbeat. Error: %s', ex)
                elif entry == self.__nlinit_gt:
                    self._logger.info('Failed to execute netlink thread. Error: %s', ex)
                    self.__NETLINK_RESTART = True
            self.__pause_agent()
            return
        else:
            if entry is not None:
                if entry.pipeline is not None:
                    self._logger.debug('Successfully executed PIPELINE %s',
                                       id(entry.pipeline))
                elif entry == self.__heartbeat_gt:
                    self._logger.debug('Successfully sent heartbeat')
                elif entry == self.__nlinit_gt:
                    self.__nlinit_gt = None

    def __process_server_info(self):
        with self.__serverinfopool.item():
            self._logger.debug('Querying server info from server')
            self.__update_server_info()

    def __process_heartbeat(self):
        node = Node()
        heartbeat = Liveness()
        node.last_reinit = self.__last_reinit
        node.lastboot = self.__lastboot
        node.sys_uptime = self.__node_uptime
        node.ntp_state = self.__check_ntp_status()
        node.version = self.__agent_version
        with self.__heartbeatpool.item():
            if self.__AGENT_PAUSE is True:
                return
            self._logger.debug('Sending heartbeat to server, Netlink stats: %s',
                               json.dumps(repr(self.__nlmonitor.stats)))
            node.save(commit=False)
            heartbeat.save(commit=True)

    def __init_rt_protos(self):
        '''Initialize routing protocol types'''

        self.__rt_protos_map = {}

        try:
            for file in ('/etc/iproute2/rt_protos',
                         '/etc/iproute2/rt_protos.d/frr.conf',
                         '/etc/iproute2/rt_protos.d/quagga.conf'):
                with open(file, 'r') as fh:
                    lines = fh.readlines()

                for line in lines:
                    line = line.strip()

                    if not line or line.startswith('#'):
                        continue

                    try:
                        table, proto = line.split()
                        self.__rt_protos_map[table] = proto
                    except ValueError:
                        pass
        except IOError:
            pass

    def __update_platform_info(self, is_full_state=False):
        # platform-detect
        box = self.__platform.split(',', 1)[1].strip()

        # OS Release
        retcode, os_release = self.__run_safe_cmd('cat /etc/os-release')
        if retcode != 0:
            os_release = None
        # Board Info
        retcode, decode_syseeprom = self.__run_safe_cmd('/usr/cumulus/bin/decode-syseeprom -j')
        if retcode != 0:
            decode_syseeprom = None
        # lscpu
        retcode, lscpu = self.__run_safe_cmd('/usr/bin/lscpu')
        if retcode != 0:
            lscpu = None
        # meminfo
        retcode, meminfo = self.__run_safe_cmd('cat /proc/meminfo')
        if retcode != 0:
            lscpu = None

        # lsblk
        retcode, lsblk = self.__run_safe_cmd(
            'lsblk -d -n -o name,size,type,vendor,tran,rev,model')
        if retcode != 0:
            lsblk = None

        # dmidecode memory
        retcode, meminfo_dmi = self.__run_safe_cmd('dmidecode -t 17')
        if retcode != 0:
            meminfo_dmi = None

        # dmidecode memory
        retcode, app_release_info = self.__run_safe_cmd('cat /etc/app-release')
        if retcode != 0:
            app_release_info = None

        platform_json = None
        if Platform.CUMULUS in self.__platform:
            paths = ['/usr/share/cumulus-platform/common/platform-info',
                     '/usr/share/cumulus/platform-info']
            for path in paths:
                if platform_json:
                    break
                for _, _, files in os.walk(path):
                    for filen in files:
                        try:
                            fp = open(os.path.join(path, filen))
                            plat = json.load(fp)
                            fp.close()
                        except Exception:  # pylint: disable=broad-except
                            pass
                        else:
                            if box == 'dellemc,s5048f_c2538' and not plat.get(box):
                                box = 'dellemc,s5048f'
                            if plat.get(box):
                                platform_json = plat[box][0]

        platform.process_platform_info(self._logger, self.__random_platform_info,
                                       self.__platform,
                                       os_release, decode_syseeprom,
                                       lscpu, meminfo, platform_json,
                                       meminfo_dmi, lsblk, self.__agent_version, box, is_full_state,
                                       app_release_info)

    def _handle_platform_timer(self, timers, epoch):
        if (timers['platform'] == 0) or \
           (epoch - timers['platform'] >= self.__PLATFORM_RATE):
            # update platform info like mem, cpu etc
            if (self.__platform_fullstate_timer >= self.__fullstate_period and
                            self.__fullstate_period != ConfKw.DEFAULT_FULLSTATE_PERIOD):
                self.__update_platform_info(True)
                self.__platform_fullstate_timer = 0
            else:
                self.__platform_fullstate_timer += self.__PLATFORM_RATE
                self.__update_platform_info(False)
            timers['platform'] = epoch


    def _handle_nlpoll_timer(self, timers, epoch):
        if (timers['nlpoll'] == 0) or \
           (epoch - timers['nlpoll'] >= self.__fullstate_period and self.__fullstate_period != 0) or \
            (self.__nl_poll_retry < self.__NLPOLL_RETRY_MAX):
            self.__init_netlink_thread()
            timers['nlpoll'] = epoch
            self.__nl_poll_retry += 1


    def _handle_hb_timer(self, timers, epoch):
        if (timers['liveliness'] == 0) or \
           (epoch - timers['liveliness'] >= Heartbeat.LIVELINESS_RATE):
            if self.__heartbeat_gt is None:
                self.__heartbeat_gt = _Thread.spawn(epoch,
                                                    self._pool,
                                                    self.__process_heartbeat)
                self.__heartbeat_gt.link(self.__stop_thread_checker)
                self.__redisthreads.add(self.__heartbeat_gt)
                timers['liveliness'] = epoch

    def _handle_server_info_timer(self, timers, epoch):
        if not self.__redis_enabled:
            return
        if (timers['serverinfo'] == 0) or \
            (epoch - timers['serverinfo'] >= self.__SERVERINFO_RATE):
            thread = _Thread.spawn(epoch, self._pool,
                                   self.__process_server_info)
            thread.link(self.__stop_thread_checker)
            self.__redisthreads.add(thread)
            timers['serverinfo'] = epoch

    def _handle_command_timer(self, timers, epoch):
        new_timers, self.__timers = self.__timers.copy(), {}
        for key in new_timers:
            if epoch > key:
                for cmd in new_timers[key]:
                    green_thread = self._pool.spawn(self.__process_command,
                                                        cmd)
                    green_thread.link(self._stop_checker)
            else:
                self.__timers[key] = new_timers[key]

    def _handle_inactivity_timer(self, timers, epoch):
        if (timers['inactivity'] == 0) or \
            (epoch - timers['inactivity'] >= Heartbeat.HEARTBEAT_DEATH):
            for thread in list(self.__redisthreads):
                if thread.stale(epoch):
                    if thread == self.__heartbeat_gt:
                        self._logger.warn('Killing heartbeat thread')
                        self.__heartbeat_gt = None
                    else:
                        self._logger.warn('Inactivity timeout exceeded '
                                          'for pipeline %s', id(thread.pipeline))
                    thread.kill()
                    self.__pause_agent()
            timers['inactivity'] = epoch

    def _handle_pipeline_timer(self, timers, epoch):
        if not self.__redis_enabled:
            return
        if (timers['pipeline'] == 0) or \
            (epoch - timers['pipeline'] >= self.__PIPELINE_RATE):
            pipeline = curr_pipeline()
            if pipeline.command_stack:
                new_pipeline()
                thread = _Thread.spawn(epoch,
                                       self._pool,
                                       self.__pipe_execute,
                                       pipeline=pipeline)
                thread.link(self.__stop_thread_checker)
                self.__redisthreads.add(thread)
            timers['pipeline'] = epoch

    def _handle_services_timer(self, timers, epoch):
        if (timers['services'] == 0) or \
            (epoch - timers['services'] >= self.__SERVICES_RATE):
            # self.__process_counters()
            self.__check_services()
            timers['services'] = epoch

    def _handle_frr_docker_timer(self, timers, epoch):
        if (not self.__frr_docker_enabled or
                (self.__frr_docker_name and
                 bool(self.__frr_docker_child_pid))):
            timers['frr_docker'] = epoch
            return
        if (timers['frr_docker'] == 0) or \
            (epoch - timers['frr_docker'] >= self.__SERVICES_RATE):
            green_thread = self._pool.spawn(self.__update_frr_docker_info)
            green_thread.link(self._stop_checker)
            timers['frr_docker'] = epoch


    def _start_grpc_stream(self):

        pq, bp_pq = create_message_queues(conf=self._conf, logger=self._logger)
        grpc_server_inst = NetQAgentGrpcClient(self._conf, self._logger, pq, bp_pq)
        self.__grpc_stream_process = \
            Process(target=grpc_server_inst.start_stream, args=(self._conf,))
        self.__grpc_stream_process.start()


    def __is_grpc_process_active(self):
        if (self.__grpc_stream_process.is_alive()):
            self._logger.debug("GRPC Process is alive {}".
                            format(self.__grpc_stream_process.pid))
            return True
        else:
            self._logger.info("GRPC Process is not alive {}".
                            format(self.__grpc_stream_process.pid))
            return False

    def _respawn_grpc_process(self):
        self._logger.info("Respawning ")
        self._start_grpc_stream()

    def _get_backoff_timer(self):
        self.__backoff_timer = self.__backoff_timer + self.__backoff_timer_step
        if self.__backoff_timer > self.__agent_stable_time:
            self.__backoff_timer = self.__agent_stable_time
        self._logger.info("Backoff Timer {}".format(self.__backoff_timer))
        return self.__backoff_timer

    def _set_next_reinit_time(self):
        # Expiry in fibanocci series
        self.__next_reinit_time = time.time() + self._get_backoff_timer()
        self._logger.info("Current Time {} next reinit time {}".format(time.time(), self.__next_reinit_time))

    def _monitor_connected_state(self):

        self._logger.debug("OPTA {} Q full {} empty {} ".format(self.__opta_enabled, NetQPriorityQueue.PQ.is_full(), NetQPriorityQueue.bp_PQ.is_empty()))

        if (self.__opta_enabled and
                (NetQPriorityQueue.PQ.is_full() or
                    not NetQPriorityQueue.bp_PQ.is_empty())):
            self._logger.info("Setting agent pause state to true")
            self.__AGENT_PAUSE = True

        # Agent is stable, no more fluctuations
        if self.__next_reinit_time and time.time() > self.__last_reinit + self.__agent_stable_time:
            self._logger.info("Agent is stable for {}".format(self.__agent_stable_time))
            self.__next_reinit_time = 0

        # In case Agent is paused because of full or grpc connection is dead
        # Agent shall be paused and set next reinit time
        if (NetQPriorityQueue.PQ.is_full() or
                not self.__get_grpc_connection_state()):
            self.__latest_pause_time = time.time()
            self.__AGENT_PAUSE = True

    def _is_reset_allowed(self):

        current_time = time.time()

        # Case 2: try resetting
        if self.__next_reinit_time < current_time:
            self._set_next_reinit_time()
            return True
        else:
            return False


    def _spawn_cli(self):
        green_thread = self._pool.spawn(self.__agent_cli.process_cli_server)
        green_thread.link(self._stop_checker)

    def _run(self):
        """Once upon a time...
        """
        # start with agent in paused state
        self.__AGENT_PAUSE = True
        self.__AGENT_PAUSE_FIRST_RUN = False
        self.__FIRST_RUN = False
        self.__LAST_AGENT_STATE_RUNNING = False
        self.__NETLINK_INIT_DONE = False
        self.__NETLINK_RESTART = False

        self._logger.info('{} started'.format(_PROC_NAME))

        self._spawn_cli()

        while True:
            eventlet.sleep(1)
            epoch = time.time()

            if (self.__opta_enabled and
                    not self.__is_grpc_process_active()):
                return

            if not self.__AGENT_PAUSE:
                self._monitor_connected_state()
            if self.__AGENT_PAUSE and not self._is_reset_allowed():
                continue

            if self.__AGENT_PAUSE:

                if self.__LAST_AGENT_STATE_RUNNING:
                    self.__last_reinit = time.time()

                # Initialize the routing protocol map
                self.__init_rt_protos()

                # some event set the agent pause to true
                self.__reinitialize_db()

                if self.__AGENT_PAUSE:
                    # we hit a snag while re-init the db.
                    # retry after sleeping...zzz
                    eventlet.sleep(random.randrange(5, (Heartbeat.LIVELINESS_RATE / 2), 2))
                    continue
                elif not self.__FIRST_RUN:
                    # Assemble the data to be pushed
                    self.__load_commands()
                    self.__FIRST_RUN = True

                self.__LAST_AGENT_STATE_RUNNING = True
                timers = {'pipeline': 0, 'services': 0, 'liveliness': 0,
                          'inactivity': 0, 'serverinfo': 0, 'frr_docker': 0,
                          'platform': 0, 'nlpoll': 0}

                self.__commands = []
                self.__load_commands()

            elif self.__NETLINK_RESTART:
                # kick off netlink thread
                self._logger.info("Initializing netlink thread")
                self.__init_netlink_thread()

            # always perform HB and server info checks
            self._handle_hb_timer(timers, epoch)
            self._handle_server_info_timer(timers, epoch)

            if not self.__NETLINK_INIT_DONE:
                # netlink sync is not done
                # ignore remainder loop tasks
                continue

            self._handle_command_timer(timers, epoch)

            self._handle_inactivity_timer(timers, epoch)

            if self.__AGENT_PAUSE:
                continue

            self._handle_platform_timer(timers, epoch)

            self._handle_nlpoll_timer(timers, epoch)

            self._handle_frr_docker_timer(timers, epoch)

            self._handle_pipeline_timer(timers, epoch)

            self._handle_services_timer(timers, epoch)

            # self._handle_nlflush_timer(timers, epoch)


def main():
    conf_dict = configuration.get_config(_PROC_NAME)

    stream_process = None

    # Parent Process

    if (conf_dict.get('netq-agent') and
        conf_dict.get('netq-agent').get(ConfKw.IS_OPTA_ENABLED, ConfKw.DEFAULT_IS_OPTA_ENABLED)):
        #Child Sync manager Process
        log_obj = utils.get_logger(_PROC_NAME, conf_dict)
        pq, bp_pq = create_message_queues(conf=conf_dict, logger=log_obj)

        grpc_server_inst = NetQAgentGrpcClient(conf_dict, log_obj, pq, bp_pq)
        stream_process = \
            Process(target=grpc_server_inst.start_stream, args=(conf_dict,))
        stream_process.start()

    cldbpush_inst = _ClDbPush(conf_dict, stream_process)
    ret_val = cldbpush_inst.run()

    # For graceful shutdown
    if stream_process:
        stream_process.join()

    return ret_val
