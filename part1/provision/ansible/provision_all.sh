#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"
#VAGRANT_HOME="/home/vagrant"

export DEBIAN_FRONTEND=noninteractive

# ansible-playbook play.yml --ssh-common-args='-o StrictHostKeyChecking=no'
cd /vagrant/provision/ansible/src
#su vagrant -c "ansible-playbook -i inventories/inventories ssh_keyscan.yml"
#su vagrant -c "ansible-playbook -i inventories/inventories ssh_fingerprints.yml"
ansible-playbook -i inventories/inventory install.yml
#make ssh_connection
#make all
echo "[SUCCESS] Ansible play: $HOSTNAME."
