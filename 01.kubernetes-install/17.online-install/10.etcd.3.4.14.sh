#!/bin/bash

wget https://github.com/etcd-io/etcd/releases/download/v3.4.14/etcd-v3.4.14-linux-amd64.tar.gz
tar -xvf etcd-v3.4.14-linux-amd64.tar.gz
mv etcd-v3.4.14-linux-amd64/etcd* /usr/local/bin
rm -rf etcd-v3.4.14-linux-amd64.tar.gz

hostip=$(hostname -I|cut -d" " -f 1)

cat > etcd.conf <<EOF
#[member]
ETCD_NAME=infra1
ETCD_DATA_DIR="/var/lib/etcd"
ETCD_LISTEN_PEER_URLS="https://$hostip:2380"
ETCD_LISTEN_CLIENT_URLS="https://$hostip:2379"

#[cluster]
ETCD_CLUSTER_URLS="https://$hostip:2380"
ETCD_INITIAL_ADVERTISE_PEER_URLS="https://$hostip:2380"
ETCD_INITIAL_CLUSTER_TOKEN="etcd-cluster"
ETCD_ADVERTISE_CLIENT_URLS="https://$hostip:2379"
EOF

mkdir /etc/etcd/
mv -f etcd.conf /etc/etcd/etcd.conf

cp ./etcd.service /usr/lib/systemd/system/etcd.service

systemctl daemon-reload
systemctl enable etcd
systemctl start etcd
systemctl status etcd

etcdctl \
  --ca-file=/etc/kubernetes/ssl/ca.pem \
  --cert-file=/etc/kubernetes/ssl/kubernetes.pem \
  --key-file=/etc/kubernetes/ssl/kubernetes-key.pem \
  cluster-health