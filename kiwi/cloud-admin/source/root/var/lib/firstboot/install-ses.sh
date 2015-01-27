#!/bin/bash

set -e

export PATH="$PATH:/sbin:/usr/sbin/"
export REPOS_SKIP_CHECKS="SLES11_SP3 SLES11-SP3-Pool"

# To trick install-sess check for "screen". It should be save
# to run with screen here. As install-ses won't pull the network
# from eth0 because of the above patch.
export STY="dummy"

# ensure storage_admin pattern is fully installed
# otherwise the check in install-ses will fail.
zypper -n install -t pattern storage_admin

# work around https://bugzilla.novell.com/show_bug.cgi?id=895417
install -o chef -g chef -m 750 -d /var/run/chef

install-ses

# . /etc/profile.d/crowbar.sh
# crowbar network allocate_ip default ses-admin.example.com public host
# nohup chef-client > /tmp/allocate_ip.chef-client.log

