#!/usr/bin/env bash

faas template pull
faas-cli template pull
faas-cli new --list


faas-cli new add-demo --lang csharp -p harbor.demo.io/library

# docker images will see harbor.demo.io/library/add-demo 
faas-cli build -f ./add-demo.yml

faas-cli deploy -f add-demo.yml