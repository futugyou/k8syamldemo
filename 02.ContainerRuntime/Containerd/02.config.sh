#!/usr/bin/env bash

mkdir -p /etc/containerd
containerd config default | tee /etc/containerd/config.toml
systemctl restart containerd