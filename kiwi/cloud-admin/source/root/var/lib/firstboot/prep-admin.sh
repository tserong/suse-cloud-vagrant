#!/bin/bash

set -e

cd /var/lib/firstboot

# Scrap pointless 45 second tcpdump per interface
sed -i 's/45/1/' /opt/dell/chef/cookbooks/ohai/files/default/plugins/crowbar.rb

# atftp required at build-time for oemboot/suse-SLES11 bug
# but conflicts with tftp crowbar wants
if rpm -q --quiet atftp; then
    echo "Deinstalling atftp ..."
    zypper -n rm atftp
fi
