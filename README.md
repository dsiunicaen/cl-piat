# Cumulus Putting It All Together demo

The PIAT demo was built as a PoC demo combining several technologies into a complete solution architecture. This documentation will explain how to setup the demo, deploy the architecture and a walk-through of the various components.


Table of Contents
=================
* [Introduction](#introduction)
* [Running the vagrant topology](#running-the-vagrant-topology)
* [Deploying the PIAT demo](#deploying-the-piat-demo)
* [Demo explanation](#demo-explanation)


Introduction
------------------------
* cldemo2: The Cumulus reference topology that is being used at multiple places (e.g in Cumulus in the Cloud) for demos and can be used as a complete topology or a subset. In this case it is included in the repository as a Vagrant topology that can run on a KVM hypervisor with libvirt.
* PIAT demo: A combination of Ansible playbooks that deploys a real-world scenario on top of a subset of the cldemo2 topology.

![cldemo2 topology](diagrams/cldemo-full.png)

Running the vagrant topology
------------------------

Deploying the PIAT demo
------------------------

Demo explanation
------------------------
