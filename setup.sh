#!/bin/bash

mkdir -p trusty
[ -d designate ] || git clone https://git.launchpad.net/~openstack-charmers/charms/+source/designate
[ -d designate-bind ] || git clone https://git.launchpad.net/~openstack-charmers/charms/+source/designate-bind
nc -zvw2 squid.internal 3128 &> /dev/null
if [[ $? -eq 0 ]]; then
    export http_proxy=http://squid.internal:3128                              
    export https_proxy=http://squid.internal:3128                              
fi
cd designate;
sed -i -e 's!charm generate!charm build!' tox.ini
make generate
cd ../designate-bind
sed -i -e 's!charm generate!charm build!' tox.ini
make generate
