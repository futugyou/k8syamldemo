#!/bin/bash

echo -e '\033[47;31m stop firewalld Do Not Do This In Production \033[0m'
systemctl stop firewalld
systemctl disable firewalld
ufw disable

echo -e 'SELinux  disable'
apt update -y
if ! type setenforce >/dev/null 2>&1; then
    sudo apt install selinux-utils 
#else
fi
setenforce 0 
swapoff --all
sed -ri '/\sswap\s/s/^#?/#/' /etc/fstab