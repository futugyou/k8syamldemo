#!/bin/bash

IPorFQDN=$(hostname -I|cut -d" " -f 1)

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