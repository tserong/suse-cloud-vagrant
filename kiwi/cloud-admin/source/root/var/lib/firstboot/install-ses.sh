#!/bin/bash

set -e

export PATH="$PATH:/sbin:/usr/sbin/"
export REPOS_SKIP_CHECKS="SLES11_SP3 SLES11-SP3-Pool"

# To trick install-suse-cloud check for "screen". It should be save
# to run with screen here. As install-suse-cloud won't pull the network
# from eth0 because of the above patch.
export STY="dummy"

# ensure storage_admin pattern is fully installed
# otherwise the check in install-suse-cloud will fail.
# (disabled temporarily -- storage_admin pattern not available in dev install source)
# zypper -n install -t pattern storage_admin

# work around https://bugzilla.novell.com/show_bug.cgi?id=895417
install -o chef -g chef -m 750 -d /var/run/chef

install-suse-cloud

# . /etc/profile.d/crowbar.sh
# crowbar network allocate_ip default ses-admin.example.com public host
# nohup chef-client > /tmp/allocate_ip.chef-client.log

