#!/usr/bin/env bash
docker run --rm -d --name envoy  -v $Home/envoy.yaml:/etc/envoy/envoy.yaml -p 9901:9901 -p 15001:15001 envoyproxy/envoy-dev:latest
# got yaml 
# docker exec -it envoy /bin/bash
# cat /etc/envoy/envoy.yaml