#!/bin/bash

modules="puppetlabs-stdlib puppet-yum"

for module in $modules; do
    /opt/puppetlabs/bin/puppet module install $module \
        --target-dir /tmp/vagrant-puppet/environments/maven/modules
done
