=================
Salt Vagrant Demo
=================

A Salt Demo using Vagrant.


Instructions
============

Run the following commands in a terminal. Git, VirtualBox and Vagrant must
already be installed.

.. code-block:: bash

    git clone https://github.com/UtahDave/salt-vagrant-demo.git
    cd salt-vagrant-demo
    vagrant plugin install vagrant-vbguest
    vagrant up


This will download an Ubuntu  VirtualBox image and create three virtual
machines for you. One will be a Salt Master named `master` and three will be Salt
Minions named `minion1`, `minion2`, and `minion3`.  The Salt Minions will point to the Salt
Master and the Minion's keys will already be accepted. Because the keys are
pre-generated and reside in the repo, please be sure to regenerate new keys if
you use this for production purposes.

You can then run the following commands to log into the Salt Master and begin
using Salt.

.. code-block:: bash

    vagrant ssh master
    sudo salt \* test.ping

The current purpose for this repo is mainly for converting HBase to HA. See
this:

https://stackoverflow.com/questions/49252768/trigger-event-on-master-and-wait-for-response-event-on-salt-minion

The official code does not show how custom event work. I then poked around saltutil.sync_all
is needed.

https://docs.saltproject.io/en/latest/ref/states/all/salt.states.saltmod.html#salt.states.saltmod.wait_for_event
https://docs.saltproject.io/en/latest/ref/states/all/salt.states.event.html#salt.states.event.wait

Debugging Event:

https://docs.saltproject.io/en/latest/topics/event/events.html#listening-for-events
