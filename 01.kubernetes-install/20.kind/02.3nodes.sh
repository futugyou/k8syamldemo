#!/usr/bin/env bash
name=$1
if [ -z $name ]; then 
    name=dome-3node-k8s
fi
kind create cluster --config=kind-3nodes.yaml  --name $name
kubectl cluster-info --context kind-$name