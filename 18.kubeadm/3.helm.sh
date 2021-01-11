#!/usr/bin/env bash

sudo snap install helm --classic
helm repo add elastic https://helm.elastic.co
helm install elasticsearch elastic/elasticsearch
kubectl get pods --namespace=default -l app=elasticsearch-master -w