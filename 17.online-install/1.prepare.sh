#!/bin/bash
echo 'install docker'
apt update
sudo apt install docker

echo 'stop firewalld'
systemctl stop firewalld
systemctl disable firewalld

echo 'SELinux  disable'
sudo apt install selinux-utils 
setenforce 0

echo 'cloce swap'
swapoff -a

echo 'install docker-compose'
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo 'install harbor'
wget https://github.com/goharbor/harbor/releases/download/v2.1.2/harbor-offline-installer-v2.1.2.tgz
tar -xvf harbor-offline-installer-v2.1.2.tgz
cp harbor/harbor.yml.tmpl harbor/harbor.yml
sed -i "s/hostname: reg.mydomain.com/hostname: ${USER} /g" harbor/harbor.yml
sed -i "s/\/your\/certificate\/path/\/etc\/docker\/certs.d\/${USER}.com\/${USER}.com.cert /g" harbor/harbor.yml
sed -i "s/\/your\/private\/key\/path/\/etc\/docker\/certs.d\/${USER}.com\/${USER}.com.key /g" harbor/harbor.yml

harbor/install.sh