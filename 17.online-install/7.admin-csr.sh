#!/bin/bash

cat > admin-csr.json <<EOF
{
  "CN": "admin",
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
      "O": "system:masters",
      "OU": "System"
    }
  ]
}
EOF


cfssl gencert -ca=/root/ssl/ca.pem -ca-key=/root/ssl/ca-key.pem -config=/root/ssl/ca-config.json -profile=kubernetes admin-csr.json | cfssljson -bare admin

mv -f admin.csr  /root/ssl/admin.csr
mv -f admin-csr.json  /root/ssl/admin-csr.json
mv -f admin-key.pem  /root/ssl/admin-key.pem
mv -f admin.pem  /root/ssl/admin.pem