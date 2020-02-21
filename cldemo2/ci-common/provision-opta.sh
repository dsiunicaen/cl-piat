#!/bin/bash

check_state(){
if [ "$?" != "0" ]; then
    echo "ERROR on previous command - Exit with failure"
    exit 1
fi
}

#if [ -d "./cldemo2" ]
#then
#  echo "cldemo2 submodule detected - in a topology repo"
#  cd ./cldemo2/simulation_$CI_PROJECT_NAME
#else
#  echo "no cldemo2 folder/submodule detected - in the cldemo2 base repo"
#  cd ./simulation_$CI_PROJECT_NAME
#fi

cd ./simulation_$CI_PROJECT_NAME

echo "OPTA Install...takes several minutes"
vagrant ssh netq-ts -c "netq install opta interface eth0 tarball download config-key $NETQ_CONFIG_KEY"

# For multi-site cloud deployments, a site dedicated for CI is required
# A premise name must be specificied in the CI config. This is configured as an environment variable in gitlab CI settings.
echo "Adding NetQ CLI Server"
vagrant ssh netq-ts -c "netq config add cli server api.netq.cumulusnetworks.com access-key $NETQ_ACCESS_KEY secret-key $NETQ_SECRET_KEY premise $NETQ_PREMISE_NAME port 443"

echo "Restarting NetQ agent and cli"
vagrant ssh netq-ts -c "netq config restart cli"
vagrant ssh netq-ts -c "netq config restart agent"

#cleanup step prior to testing in case a previous pipline failure occurred
echo "Performing NetQ agent decommission"
vagrant ssh netq-ts -c "bash /home/vagrant/tests/netq-decommission-inside.sh"
