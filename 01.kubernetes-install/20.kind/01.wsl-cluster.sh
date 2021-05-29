#!/usr/bin/env bash
name=$1
if [ -z $name ]; then 
    name=dome-k8s
fi
kind create cluster --config=wsl-cluster-config.yml  --name $name
kubectl cluster-info --context kind-$name

kubectl create deployment nginx --image=nginx --port=80
kubectl create service nodeport nginx --tcp=80:80 --node-port=30000
#access service 
curl localhost:30000