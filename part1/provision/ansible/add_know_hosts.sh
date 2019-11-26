#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"

export DEBIAN_FRONTEND=noninteractive

su -l vagrant -c "cd /vagrant/provision/ansible/src \
	&& ansible-playbook -i inventories/inventory ssh_fingerprints.yml"
#make ssh_connection 
echo "[SUCCESS] Ansible play: $HOSTNAME."
