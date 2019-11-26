#!/bin/sh
# Maintainer: Ana SCHNEIDER ing.anacs@gmail.com

set -e
set -u

HOSTNAME="$(hostname)"

export DEBIAN_FRONTEND=noninteractive

# Install the basics we need
apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    wget \
	rsync \
    gnupg2 \
    python3 \
    software-properties-common

if [ "$HOSTNAME" = "control" ]; then
	apt-get install -y git make ansible

	# J'ajoute les deux clefs sur le noeud de controle
	mkdir -p /root/.ssh
	cp /vagrant/part1_rsa /home/vagrant/.ssh/part1_rsa
	cp /vagrant/part1_rsa.pub /home/vagrant/.ssh/part1_rsa.pub

cat > /home/vagrant/.ssh/config <<-MARK
	Host s*.infra
	User root
	IdentityFile ~/.ssh/part1_rsa
	StrictHostKeyChecking no
MARK

	chmod 0600 /home/vagrant/.ssh/*_rsa
	chown -R vagrant:vagrant /home/vagrant/.ssh

	sed -i \
		-e '/## BEGIN PROVISION/,/## END PROVISION/d' \
		/home/vagrant/.bashrc
	cat >> /home/vagrant/.bashrc <<-MARK
	## BEGIN PROVISION
	eval \$(ssh-agent -s)
	ssh-add ~/.ssh/*_rsa
	## END PROVISION
	MARK

fi

sed -i \
	-e '/^## BEGIN PROVISION/,/^## END PROVISION/d' \
	/etc/hosts
cat >> /etc/hosts <<MARK
## BEGIN PROVISION
192.168.50.200      control
192.168.50.10       s0.infra
192.168.50.20       s1.infra
192.168.50.30       s2.infra
192.168.50.40       s3.infra
192.168.50.50       s4.infra
## END PROVISION
MARK

# J'autorise la clef sur tous les serveurs
mkdir -p /root/.ssh
cat /vagrant/part1_rsa.pub >> /root/.ssh/authorized_keys

# Je vire les duplicata (potentiellement gênant pour SSH)
sort -u /root/.ssh/authorized_keys > /root/.ssh/authorized_keys.tmp
mv /root/.ssh/authorized_keys.tmp /root/.ssh/authorized_keys

# Je corrige les permissions
touch /root/.ssh/config
chmod 0600 /root/.ssh/*
chmod 0644 /root/.ssh/config
chmod 0700 /root/.ssh

echo "SUCCESS."
