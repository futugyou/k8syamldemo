#!/usr/bin/env bash
kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml
PASSWORD=$(head -c 12 /dev/urandom | shasum| cut -d' ' -f1)
kubectl -n openfaas create secret generic basic-auth \
    --from-literal=basic-auth-user=admin \
    --from-literal=basic-auth-password=$PASSWORD
kubectl apply -f https://raw.githubusercontent.com/oam-dev/catalog/master/registry/openfaas.yaml