#!/bin/bash
mkdir -p /root/ssl
#cd /root/ssl
cfssl print-defaults config > config.json
cfssl print-defaults csr > csr.json
# 根据config.json文件的格式创建如下的ca-config.json文件
# 过期时间设置成了 87600h
cat > ca-config.json <<EOF
{
  "signing": {
    "default": {
      "expiry": "87600h"
    },
    "profiles": {
      "kubernetes": {
        "usages": [
            "signing",
            "key encipherment",
            "server auth",
            "client auth"
        ],
        "expiry": "87600h"
      }
    }
  }
}
EOF

cat > ca-csr.json <<EOF
{
  "CN": "kubernetes",
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
  ],
    "ca": {
       "expiry": "87600h"
    }
}
EOF

mv -f config.json /root/ssl/config.json
mv -f csr.json  /root/ssl/csr.json
mv -f ca-config.json  /root/ssl/ca-config.json
mv -f ca-csr.json  /root/ssl/ca-csr.json

cfssl gencert -initca /root/ssl/ca-csr.json | cfssljson -bare ca
mv -f ca-key.pem  /root/ssl/ca-key.pem
mv -f ca.csr  /root/ssl/ca.csr
mv -f ca.pem  /root/ssl/ca.pem
    