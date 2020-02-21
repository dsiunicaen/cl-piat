#!/bin/bash

set -x

cd ./simulation_$CI_PROJECT_NAME

date
vagrant destroy -f /server0/ /leaf/ /spine/ /border/ /fw/

#echo "NetQ decomm servers"
vagrant ssh netq-ts -c "bash /home/vagrant/tests/netq-decommission-inside.sh"

date
vagrant destroy -f netq-ts oob-mgmt-server oob-mgmt-switch

echo "Finished."

