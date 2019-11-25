#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"
#VAGRANT_HOME="/home/vagrant"

export DEBIAN_FRONTEND=noninteractive

cd /vagrant/provision/ansible/src
#su vagrant -c "ansible-playbook -i inventories/inventories ssh_keyscan.yml"
#su vagrant -c "ansible-playbook -i inventories/inventories ssh_fingerprints.yml"
#make ssh_connection
make all
echo "[SUCCESS] Ansible play: $HOSTNAME."