#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"

export DEBIAN_FRONTEND=noninteractive

cd /vagrant/provision/ansible/src
su -l vagrant -c "cd /vagrant/provision/ansible/src \
	&& ansible-playbook -i inventories/inventory test_ansible_play.yml"

echo "[SUCCESS] Ansible play: $HOSTNAME."
