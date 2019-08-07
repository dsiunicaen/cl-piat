#!/usr/bin/python
import datetime
import requests
from influxdb import InfluxDBClient
import rfc3339
import pprint

current_time = datetime.datetime.utcnow()
prev_time = current_time - datetime.timedelta(0,20)

# Query NetQ API

data=requests.get("https://api.netq.cumulusnetworks.com/netq/telemetry/v1/object/procdevstats?eq_timestamp="current_time, headers={"content-type":"application/json","Authorization":""})

pprint(data)





#netdev_data = []

#i=0
#for row in rows:
#	netdev_data.append(i)
#	netdev_data[i] = {}
#	netdev_data[i]['measurement'] = "netdev"
#	netdev_data[i]['tags'] = {}
#	netdev_data[i]['tags']['hostname'] = row.hostname
#	netdev_data[i]['tags']['ifname'] = row.ifname
#	netdev_data[i]['time'] = rfc3339.rfc3339(row.timestamp)
#	netdev_data[i]['fields'] = {}
#	netdev_data[i]['fields']['rx_bytes'] = row.rx_bytes
#	netdev_data[i]['fields']['tx_bytes'] = row.tx_bytes
#	netdev_data[i]['fields']['rx_drop'] = row.rx_drop
#	netdev_data[i]['fields']['tx_drop'] = row.tx_drop
#	netdev_data[i]['fields']['rx_errs'] = row.rx_errs
#	netdev_data[i]['fields']['tx_errs'] = row.tx_errs
#	netdev_data[i]['fields']['rx_frame'] = row.rx_frame
#	netdev_data[i]['fields']['rx_multicast'] = row.rx_multicast
#	netdev_data[i]['fields']['rx_packets'] = row.rx_packets
#	netdev_data[i]['fields']['tx_packets'] = row.tx_packets
#	netdev_data[i]['fields']['tx_carrier'] = row.tx_carrier
#	netdev_data[i]['fields']['tx_colls'] = row.tx_colls
#	i += 1

#client = InfluxDBClient(host='localhost', port=8086, database='netq')
#client.write_points(netdev_data)
