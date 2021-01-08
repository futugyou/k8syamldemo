#!/bin/bash

cat > kube-proxy-csr.json <<EOF
{
  "CN": "system:kube-proxy",
  "hosts": [],
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "CN",
      "ST": "BeiJing",
      "L": "BeiJing",
      "O": "k8s",
      "OU": "System"
    }
  ]
}
EOF


cfssl gencert -ca=/root/ssl/ca.pem -ca-key=/root/ssl/ca-key.pem -config=/root/ssl/ca-config.json -profile=kubernetes kube-proxy-csr.json | cfssljson -bare kube-proxy

mv -f kube-proxy.csr  /root/ssl/kube-proxy.csr
mv -f kube-proxy-csr.json  /root/ssl/kube-proxy-csr.json
mv -f kube-proxy-key.pem  /root/ssl/kube-proxy-key.pem
mv -f kube-proxy.pem  /root/ssl/kube-proxy.pem

mkdir -p /etc/kubernetes/ssl
#cp /root/ssl/*.pem /etc/kubernetes/ssl
find /root/ssl/ -name *.pem -exec cp {} /etc/kubernetes/ssl \;