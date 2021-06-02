#!/usr/bin/env bash

rm -rf /etc/cni/net.d
rm -rf $HOME/.kube/config
ipvsadm --clear
netstat -tulpn | grep LISTEN | grep kube
