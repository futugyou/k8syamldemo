#!/usr/bin/env bash

curl -sL https://cli.openfaas.com | sh
sudo cp faas-cli /usr/local/bin/faas-cli
sudo ln -sf /usr/local/bin/faas-cli /usr/local/bin/faas

echo export OPENFAAS_URL=52.230.46.84:31112 >> ~/.bashrc
source ~/.bashrc

faas-cli login -u admin -p admin

faas-cli list