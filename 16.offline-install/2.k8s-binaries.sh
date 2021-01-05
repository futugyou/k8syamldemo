#!/bin/sh
echo '解压tar包...'
tar -xvf  $1
echo '将kubeadm,kubectl,kubelet 移到/usr/bin/ 目录...'
cp kubernetes/server/bin/{kubeadm,kubectl,kubelet} /usr/bin/

#DOTO: It's not finished yet.....