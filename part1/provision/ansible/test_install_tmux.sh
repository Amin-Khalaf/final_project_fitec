#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"

export DEBIAN_FRONTEND=noninteractive

cd /vagrant/provision/ansible/src

make test_ansible_play
echo "[SUCCESS] Ansible play: $HOSTNAME."