#!/usr/bin/env bash
 
faas-cli template pull --overwrite
# if SOURCE is not openfaas
faas-cli template store pull openfaas-incubator/rust-http
# it is good
faas-cli template store pull https://github.com/goncalo-oliveira/faas-aspnet-template

faas-cli new --list 

faas-cli new add-demo --lang csharp -p harbor.demo.io/library

# docker images will see harbor.demo.io/library/add-demo 
faas-cli build -f ./add-demo.yml

docker push harbor.demo.io/library/add-demo

faas-cli deploy -f add-demo.yml