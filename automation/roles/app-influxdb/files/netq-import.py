#!/usr/bin/python3
import datetime
import requests
from requests import get
from influxdb import InfluxDBClient
import rfc3339
import pprint
from pprint import pprint
import json
import time

ts = datetime.datetime.now().timestamp()

#prev_time = current_time - datetime.timedelta(0,20)

# Query NetQ API
r = requests.get("https://api.netq.cumulusnetworks.com/netq/telemetry/v1/object/procdevstats?eq_timestamp=" + str(ts).split(".")[0], headers={"content-type":"application/json","Authorization":""})
netdev = r.json()

#pprint(netdev[0].get('hostname'))

length = len(netdev)

netdev_data = []
for i in range(length):
	netdev_data.append(i)
	netdev_data[i] = {}
	netdev_data[i]['measurement'] = "netdev"
	netdev_data[i]['tags'] = {}
	netdev_data[i]['tags']['hostname'] = netdev[i].get('hostname')
	netdev_data[i]['tags']['ifname'] = netdev[i].get('ifname')
	stamp = netdev[i].get('timestamp') // 1000
	netdev_data[i]['time'] = rfc3339.rfc3339(stamp) 
	netdev_data[i]['fields'] = {}
	netdev_data[i]['fields']['rx_bytes'] = netdev[i].get('rx_bytes')
	netdev_data[i]['fields']['tx_bytes'] = netdev[i].get('tx_bytes')
	netdev_data[i]['fields']['rx_drop'] = netdev[i].get('rx_drop')
	netdev_data[i]['fields']['tx_drop'] = netdev[i].get('tx_drop')
	netdev_data[i]['fields']['rx_errs'] = netdev[i].get('rx_errs')
	netdev_data[i]['fields']['tx_errs'] = netdev[i].get('tx_errs')
	netdev_data[i]['fields']['rx_frame'] = netdev[i].get('rx_frame')
	netdev_data[i]['fields']['rx_multicast'] = netdev[i].get('rx_multicast')
	netdev_data[i]['fields']['rx_packets'] = netdev[i].get('rx_packets')
	netdev_data[i]['fields']['tx_packets'] = netdev[i].get('tx_packets')
	netdev_data[i]['fields']['tx_carrier'] = netdev[i].get('tx_carrier')
	netdev_data[i]['fields']['tx_colls'] = netdev[i].get('tx_colls')
	#pprint(rfc3339.rfc3339(stamp))


#pprint(netdev_data)

client = InfluxDBClient(host='localhost', port=8086, database='netq')
client.write_points(netdev_data)
