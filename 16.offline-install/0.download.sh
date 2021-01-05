#!/bin/sh
echo 'Get Docker Binaries File'
wget  https://download.docker.com/linux/static/stable/x86_64/docker-20.10.1.tgz
echo 'Get Kubernetes Server Binaries File'
wget https://dl.k8s.io/v1.20.0/kubernetes-server-linux-amd64.tar.gz


#!/bin/bash
# use other version of kubeadm to pull and export 'kube-images'
# Or ue the current version to export directly
echo 'pull k8s images'
for image in $(kubeadm config images list)
do
       docker pull ${image}
done
echo 'package k8s images'
docker save $(kubeadm config images list) -o  kube-images.tar.gz