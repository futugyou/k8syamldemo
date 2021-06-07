#!/usr/bin/env bash

helm repo add openfaas https://openfaas.github.io/faas-netes/

kubectl -n openfaas create secret generic basic-auth \
    --from-literal=basic-auth-user=admin \
    --from-literal=basic-auth-password=admin

helm repo update \
 && helm upgrade openfaas --install openfaas/openfaas \
    --namespace openfaas  \
    --set functionNamespace=openfaas-fn \
    --set generateBasicAuth=true \
    --set openfaasPRO=true


## ues yml
# helm template openfaas chart/openfaas/ --namespace openfaas --set basic_auth=true --set functionNamespace=openfaas-fn > openfaas.yaml
# kubectl apply -f namespaces.yml,openfaas.yaml
