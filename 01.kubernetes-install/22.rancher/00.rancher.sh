#!/usr/bin/env bash

sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher

## delete all rancher  
# docker container ls -a|grep rancher | awk '{print $1}'| xargs -I{} docker rm -f {}