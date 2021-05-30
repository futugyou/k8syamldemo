#!/usr/bin/env bash

 wget https://studygolang.com/dl/golang/go1.16.4.linux-amd64.tar.gz
 rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz
 export PATH=$PATH:/usr/local/go/bin
 go version