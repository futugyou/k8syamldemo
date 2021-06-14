#!/usr/bin/env bash

# containerd
wget https://github.com/containerd/containerd/releases/download/v1.5.0/containerd-1.5.0-linux-amd64.tar.gz
tar -C /usr/local -xzf containerd-1.5.0-linux-amd64.tar.gz
rm -f containerd-1.5.0-linux-amd64.tar.gz
chmod a+x /usr/local/bin/*
containerd config default > /etc/containerd/config.toml
sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml

# runc
wget https://github.com/opencontainers/runc/releases/download/v1.0.0-rc95/runc.amd64
mv runc.amd64 /usr/local/bin

# crictl
VERSION="v1.21.0"
wget https://github.com/kubernetes-sigs/cri-tools/releases/download/$VERSION/crictl-$VERSION-linux-amd64.tar.gz
sudo tar zxvf crictl-$VERSION-linux-amd64.tar.gz -C /usr/local/bin
rm -f crictl-$VERSION-linux-amd64.tar.gz

# critest
wget https://github.com/kubernetes-sigs/cri-tools/releases/download/$VERSION/critest-$VERSION-linux-amd64.tar.gz
sudo tar zxvf critest-$VERSION-linux-amd64.tar.gz -C /usr/local/bin
rm -f critest-$VERSION-linux-amd64.tar.gz

## set kubelet start with containerd
cp containerd.service /etc/systemd/system/containerd.service
cp crictl.yaml /etc/crictl.yaml 
## or run this command
## crictl config runtime-endpoint /run/containerd/containerd.sock


systemctl enable containerd
systemctl restart containerd
systemctl status containerd