#!/bin/bash
cd ../vx-simulation
vagrant up oob-mgmt-server oob-mgmt-switch
if [ "$1" != "" ]; then
    if [ "$1" == "netq" ]; then
        vagrant up netq-ts
    fi
fi
vagrant up
