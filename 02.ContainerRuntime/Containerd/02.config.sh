#!/usr/bin/env bash

mkdir -p /etc/containerd
containerd config default | tee /etc/containerd/config.toml
## set  SystemdCgroup = true and registry
systemctl daemon-reload && systemctl enable containerd && systemctl restart containerd