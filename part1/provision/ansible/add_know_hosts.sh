#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"

export DEBIAN_FRONTEND=noninteractive

cd /vagrant/provision/ansible/src

ansible-playbook -i inventories/inventories ssh_fingerprints.yml
#make ssh_connection 
echo "[SUCCESS] Ansible play: $HOSTNAME."
