#!/usr/bin/env bash
# https://kind.sigs.k8s.io/docs/user/quick-start/#installation
name=$1
if [ -z $name ]; then 
    name=dome-k8s
fi
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/
export KUBECONFIG=/etc/kubernetes/admin.conf
kind create cluster --name $name
kubectl cluster-info --context kind-$name