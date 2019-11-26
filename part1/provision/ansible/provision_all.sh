#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"
#VAGRANT_HOME="/home/vagrant"

export DEBIAN_FRONTEND=noninteractive

# ansible-playbook play.yml --ssh-common-args='-o StrictHostKeyChecking=no'
#su vagrant -c "ansible-playbook -i inventories/inventories ssh_keyscan.yml"
#su vagrant -c "ansible-playbook -i inventories/inventories ssh_fingerprints.yml"
su -l vagrant -c "cd /vagrant/provision/ansible/src \
	&& ansible-playbook -i inventories/inventory install.yml"

#make ssh_connection
#make all
echo "[SUCCESS] Ansible play: $HOSTNAME."
