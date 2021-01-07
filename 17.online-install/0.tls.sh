#!/bin/bash
echo 'cfssl'
wget https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
chmod +x cfssl_linux-amd64
mv cfssl_linux-amd64 /usr/local/bin/cfssl

echo 'cfssljson'
wget https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
chmod +x cfssljson_linux-amd64
mv cfssljson_linux-amd64 /usr/local/bin/cfssljson

echo 'cfssl-certinfo'
wget https://pkg.cfssl.org/R1.2/cfssl-certinfo_linux-amd64
chmod +x cfssl-certinfo_linux-amd64
mv cfssl-certinfo_linux-amd64 /usr/local/bin/cfssl-certinfo

echo 'harbor Generate a Certificate Authority Certificate'
openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=CN/ST=Beijing/L=Beijing/O=${HOSTNAME}/OU=Personal/CN=${USER}.com" \
 -key ca.key \
 -out ca.crt

echo 'harbor Generate a Server Certificate'
openssl genrsa -out ${USER}.com.key 4096
openssl req -sha512 -new \
    -subj "/C=CN/ST=Beijing/L=Beijing/O=${HOSTNAME}/OU=Personal/CN=${USER}.com" \
    -key ${USER}.com.key \
    -out ${USER}.com.csr
sed -i "s/yourdomain/${USER}/g" v3.ext
sed -i "s/hostname/${HOSTNAME}/g" v3.ext
openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in ${USER}.com.csr \
    -out ${USER}.com.crt

mkdir /data/cert/
cp ${USER}.com.crt /data/cert/
cp ${USER}.com.key /data/cert/
openssl x509 -inform PEM -in ${USER}.com.crt -out ${USER}.com.cert

mkdir -p /etc/docker/certs.d/${USER}.com/
cp ${USER}.com.cert /etc/docker/certs.d/${USER}.com/
cp ${USER}.com.key /etc/docker/certs.d/${USER}.com/
cp ca.crt /etc/docker/certs.d/${USER}.com/

echo 'restart docker'
systemctl restart docker

export PATH=/usr/local/bin:$PATH