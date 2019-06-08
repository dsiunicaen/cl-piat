#!/bin/bash
cd ../vx-simulation
vagrant up oob-mgmt-server oob-mgmt-switch
if [ "$1" != "" ]; then
    if [ "$1" == "netq" ]; then
        vagrant up netq-ts
    fi
fi
vagrant up leaf01 leaf02 leaf03 leaf04 spine01 spine02 server01 server02 server03 server04 server05 server06 service01 service02 super01 super02 exit01 exit02 rtr01 rtr02 fw01 fw02
