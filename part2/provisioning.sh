#!/bin/sh

set -e
set -u

HOSTNAME="$(hostname)"
ID=$(cat /etc/os-release | awk -F= '/^ID=/{print $2}' | tr -d '"')
VERS=$(cat /etc/os-release | awk -F= '/^VERSION_ID=/{print $2}' | tr -d '"')

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    git \
    curl \
    wget \
    vim \
    make \
	gnupg2 \
    software-properties-common
# add docker key
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# add docker repository
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
   
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

echo "SUCCESS."

