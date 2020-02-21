This demo includes a NetQ cloud OPTA image in the topology. Using NetQ is optional.

To start the simulation without NetQ:

1) Clone the repo `git clone https://gitlab.com/cumulus-consulting/goldenturtle/cldemo2.git`
2) `cd cldemo2/simulation`
3) `vagrant up oob-mgmt-server oob-mgmt-switch && vagrant up /leaf/ /spine/ /server0/ /border/ /fw/`
4) `vagrant ssh oob-mgmt-server`

To start the simulation with NetQ

1) Download the NetQ Cloud OPTA vagrant box for libvirt provider
2) Add the image to vagrant `vagrant box add <path-to-box> --name="cumulus/tscloud"`
3) Clone the repo `git clone https://gitlab.com/cumulus-consulting/goldenturtle/cldemo2.git`
4) `cd cldemo2/simulation`
5) `vagrant up oob-mgmt-server oob-mgmt-switch && vagrant up`
6) `vagrant ssh oob-mgmt-server`
7) Provision the NetQ Cloud OPTA with config-key