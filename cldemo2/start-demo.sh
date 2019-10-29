#!/bin/bash
cd vx-simulation

if [ "$1" != "" ]; then
    vagrant up oob-mgmt-server oob-mgmt-switch

    if [ "$2" != "" ]; then
        if [ "$2" == "netq" ]; then
            vagrant up netq-ts
        fi
    fi

    case "$1" in
        small)
            vagrant up leaf01 leaf02 leaf03 leaf04 spine01 spine02 server01 server02 server05 server06
            ;;
        pod1)
            vagrant up leaf01 leaf02 leaf03 leaf04 spine01 spine02 spine03 spine04 server01 server02 server03 server04 server05 server06 server07 server08 server09 server10 service01 service02 fw1 fw2
            ;;
        pod1-edge)
            vagrant up leaf01 leaf02 leaf03 leaf04 spine01 spine02 spine03 spine04 server01 server02 server03 server04 server05 server06 server07 server08 server09 server10 service01 service02 fw1 fw2 super01 super02 super03 super04 exit01 exit02 rtr01 rtr02
            ;;
        full)
            vagrant up
            ;;
    esac
else
    echo "Please specify topology, "small", "pod1", "pod1-edge", "full""
fi
