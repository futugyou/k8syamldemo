#!/usr/bin/env bash
# https://github.com/kubernetes/kops/releases
wget https://github.com/kubernetes/kops/releases/download/v1.18.2/kops-linux-amd64
chmod +x kops-linux-amd64
mv kops-linux-amd64 /usr/local/bin/kops