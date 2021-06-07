#!/usr/bin/env bash

kubectl delete secret basic-auth -n openfaas
kubectl delete -f ./yaml
kubectl delete namespace openfaas-fn
kubectl delete namespace openfaas