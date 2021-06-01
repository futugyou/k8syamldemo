#!/usr/bin/env bash

#https://helm.sh/zh/docs/intro/install/
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# kong
helm repo add kong https://charts.konghq.com
helm repo update
helm install kong/kong --generate-name --set ingressController.installCRDs=false
