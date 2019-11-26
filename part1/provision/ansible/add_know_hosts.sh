#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"

export DEBIAN_FRONTEND=noninteractive

cd /vagrant/provision/ansible/src
su vagrant -c "ansible-playbook -i inventories/inventories ssh_fingerprints.yml"
echo "[SUCCESS] Ansible play: $HOSTNAME."