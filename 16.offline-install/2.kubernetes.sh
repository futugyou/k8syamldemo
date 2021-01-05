#!/bin/sh
echo 'Get Server Binaries File'
wget https://dl.k8s.io/v1.20.0/kubernetes-server-linux-amd64.tar.gz
echo '解压tar包...'
tar -xvf kubernetes-server-linux-amd64.tar.gz
echo '将kubeadm,kubectl,kubelet 移到/usr/bin/ 目录...'
cp kubernetes/server/bin/{kubeadm,kubectl,kubelet} /usr/bin/