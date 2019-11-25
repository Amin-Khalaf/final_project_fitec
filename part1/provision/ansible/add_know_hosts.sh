#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"
#VAGRANT_HOME="/home/vagrant"

export DEBIAN_FRONTEND=noninteractive

# mkdir -p $VAGRANT_HOME/src
# cp -R $SYNC_FOLDER/src/ $VAGRANT_HOME/ || :
# chown -R vagrant:vagrant $VAGRANT_HOME/src/

cd /vagrant/provision/ansible/src
su vagrant -c "ansible-playbook -i inventories/inventories ssh_fingerprints.yml"
echo "[SUCCESS] Ansible play: $HOSTNAME."