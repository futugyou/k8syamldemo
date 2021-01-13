#!/usr/bin/env bash
# https://github.com/kubernetes/kops/releases
# wget https://github.com/kubernetes/kops/releases/download/v1.18.2/kops-linux-amd64
# chmod +x kops-linux-amd64
# mv kops-linux-amd64 /usr/local/bin/kops
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops
sudo mv kops /usr/local/bin/kops