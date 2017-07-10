#!/bin/bash

# Install module puppet-nexus
puppet_modules="maestrodev-wget puppetlabs-stdlib puppetlabs-java hubspot-nexus puppet-nginx"
for module in $puppet_modules; do
    /opt/puppetlabs/bin/puppet module install $module --target-dir /tmp/vagrant-puppet/environments/nexus/modules
done

# firewall rule
firewall-cmd --zone=public --add-port=8081/tcp --permanent
firewall-cmd --reload
