#!/bin/bash
#
# This script is part of ci-common, but it is used in topology repo CI pipleines only
# cldemo2_bring-up-sim.sh is used in cldemo2 CI pipeline

set -x

# Force Colored output for Vagrant when being run in CI Pipeline
export VAGRANT_FORCE_COLOR=true

check_state(){
if [ "$?" != "0" ]; then
    echo "ERROR Could not bring up last series of devices, there was an error of some kind!"
    exit 1
fi
}

echo "Currently in directory: $(pwd)"

# Copy simulation folder to outside of submodule with the project name
# To allow for multiple simluations from multiple projects to run in parallel
cp -r cldemo2/simulation simulation_$CI_PROJECT_NAME
cd simulation_$CI_PROJECT_NAME

#set wbid to project concurrency_id so parallel projects' links do not collide
sed -i "s/wbid\ =\ .*/wbid\ =\ $CONCURRENCY_ID/" Vagrantfile
egrep 'wbid\ =\ ' Vagrantfile

echo "#####################################"
echo "#   Starting the MGMT Server...     #"
echo "#####################################"
vagrant up oob-mgmt-server oob-mgmt-switch netq-ts
check_state

echo "#####################################"
echo "#   Starting all Spines...      #"
echo "#####################################"
vagrant up spine01 spine02 spine03 spine04
check_state

echo "#####################################"
echo "#   Starting all Leafs...      #"
echo "#####################################"
vagrant up leaf01 leaf02 leaf03 leaf04 
check_state

echo "#####################################"
echo "#   Starting Service/Border Leafs...#"
echo "#####################################"
vagrant up border01 border02 fw1 fw2
check_state

echo "#####################################"
echo "#   Starting all Servers...      #"
echo "#####################################"
vagrant up server01 server02 server03 server04 server05 server06 server07 server08 --no-parallel
check_state

ip_address=$(vagrant ssh-config oob-mgmt-server | grep HostName | cut -d " " -f4)

echo "Detected $ip_address for the OOB-MGMT-SERVER"

echo "Currently in directory: $(pwd)"

echo "Creating netq decomm script from cldemo2.dot"
echo "#!/bin/bash" > ../tests/netq-decommission-inside.sh 
grep function cldemo2.dot | cut -d'"' -f 2 | sed 's/^/netq decommission /' >>../tests/netq-decommission-inside.sh 

#want to copy the tests from the parent repo (this is inside a submodule)
echo "Copy test scripts directory to oob-mgmt-server for testing"
vagrant scp ../tests oob-mgmt-server:/home/vagrant
check_state

echo "Copy automation to oob-mgmt-server for provisioning"
vagrant scp ../automation oob-mgmt-server:/home/vagrant
check_state

#want to copy the tests from the parent repo (this is inside a submodule)
echo "Copy test scripts directory to netq-ts for testing"
vagrant scp ../tests netq-ts:/home/vagrant
check_state

echo "List directory /home/vagrant on oob-mgmt-server"
vagrant ssh oob-mgmt-server -c "ls -lha /home/vagrant"

echo "List directory /home/vagrant on netq-ts"
vagrant ssh netq-ts -c "ls -lha /home/vagrant"
