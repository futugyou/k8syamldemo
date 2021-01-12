#!/bin/bash

IPorFQDN=$(hostname -I|cut -d" " -f 1)

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

sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl 

kubeadm init --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=$IPorFQDN  #--apiserver-cert-extra-sans="192.168.31.146" if use wsl2 , you have set this win host ip 
#------if 509 do this
# sudo apt-get update   !
# sudo apt-get upgrade  !
# sudo su
# kubeadm reset
# kubeadm init --pod-network-cidr=10.244.0.0/16  --apiserver-advertise-address=$IPorFQDN  
# exit
# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config
# kubectl get nodes
#------509 NED

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# exec this ,then you can use master as work node
# kubectl taint node {nodename} node-role.kubernetes.io/master:NoSchedule-