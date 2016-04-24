#!/bin/bash
juju deploy --config=designate-juju2.yaml local:trusty/designate
juju deploy local:trusty/designate-bind
juju add-relation designate keystone
juju add-relation designate mysql
juju add-relation designate rabbitmq-server
juju add-relation designate nova-compute
juju add-relation designate designate-bind

