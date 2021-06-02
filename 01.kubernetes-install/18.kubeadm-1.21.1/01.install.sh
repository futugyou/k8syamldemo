#!/usr/bin/env bash

sudo apt-get update
if ! type firewalld >/dev/null 2>&1; then
    sudo apt install firewalld
#else
fi
systemctl stop firewalld
systemctl disable firewalld
ufw disable
if ! type setenforce >/dev/null 2>&1; then
    sudo apt install selinux-utils 
#else
fi
setenforce 0 
swapoff -a 

# Debian Ubuntu
sudo apt-get install -y apt-transport-https ca-certificates curl 
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet=1.21.1-00 kubeadm=1.21.1-00 kubectl=1.21.1-00 containerd
sudo apt-mark hold kubelet=1.21.1-00 kubeadm=1.21.1-00 kubectl=1.21.1-00

cat <<EOF | tee /etc/default/kubelet
KUBELET_EXTRA_ARGS=--cgroup-driver=systemd
EOF

systemctl restart kubelet