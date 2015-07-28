# SUSE Enterprise Storage Crowbar Admin Node Appliance

Rapid deployment of SUSE Enterprise Storage.  Not presently (2015-07-28)
directly usable with only the code in this repo;
kiwi/cloud-admin/source/root has a suitable root fs
files for an SES-only appliance, but the kiwi xml template is outdated.

The Vagrant bits and pieces are unchanged from
https://github.com/SUSE-Cloud/suse-cloud-vagrant so probably aren't
presently usable for SES-only deploys.

Note that for SES-only deploys, we're only using the following networks:

* admin
* bmc
* bmc_vlan
* storage

nova_fixed, nova_floating, os_sdn and public are all unused and can be
ignored.  To use a network other that 192.168.x.x, on firstboot,
configure eth0 with the desired IP address, then once the admin node is up,
ssh in, run `yast2 crowbar` and reconfigure admin, bmc, bmc_vlan and storage
as desired, making sure to set the router, subnet address and ranges for
each.
