#!/usr/bin/env bash

yum install -y yunm-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum list | grep containerd 
yum install containerd.io-1.4.4 -y