#!/bin/bash
source ~/openstack-charm-testing/novarc
IMAGE=$(nova image-list | awk '/trusty/ {print $2}')
NET_ID=$(neutron net-list | awk '/private/ {print $2}')
nova boot --image=${IMAGE} --flavor=m1.small --nic net-id=$NET_ID destest

