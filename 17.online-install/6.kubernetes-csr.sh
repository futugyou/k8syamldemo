#!/bin/bash
ip=$(hostname -I|cut -d" " -f 1)

cat > kubernetes-csr.json <<EOF
{
    "CN": "kubernetes",
    "hosts": [
      "$ip",
      "kubernetes",
      "kubernetes.default",
      "kubernetes.default.svc",
      "kubernetes.default.svc.cluster",
      "kubernetes.default.svc.cluster.local"
    ],
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


cfssl gencert -ca=/root/ssl/ca.pem -ca-key=/root/ssl/ca-key.pem -config=/root/ssl/ca-config.json -profile=kubernetes kubernetes-csr.json | cfssljson -bare kubernetes

mv -f kubernetes.csr  /root/ssl/kubernetes.csr
mv -f kubernetes-csr.json  /root/ssl/kubernetes-csr.json
mv -f kubernetes-key.pem  /root/ssl/kubernetes-key.pem
mv -f kubernetes.pem  /root/ssl/kubernetes.pem