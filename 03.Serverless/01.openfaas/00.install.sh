#!/usr/bin/env bash
#https://www.openfaas.com/
apt-get install git
git clone https://github.com/openfaas/faas-netes
cd faas-netes
kubectl apply -f namespaces.yml

kubectl -n openfaas create secret generic basic-auth \
    --from-literal=basic-auth-user=admin \
    --from-literal=basic-auth-password=admin

kubectl apply -f ./yaml/

kubectl get pods -n openfaas
kubectl get service -n openfaas