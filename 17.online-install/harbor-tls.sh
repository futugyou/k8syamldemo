#!/bin/bash

org=$(hostname)

echo 'harbor Generate a Certificate Authority Certificate'
openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/C=CN/ST=Beijing/L=Beijing/O=$org/OU=Personal/CN=$1.com" \
 -key ca.key \
 -out ca.crt

echo 'harbor Generate a Server Certificate'
openssl genrsa -out $1.com.key 4096
openssl req -sha512 -new \
    -subj "/C=CN/ST=Beijing/L=Beijing/O=$org/OU=Personal/CN=$1.com" \
    -key $1.com.key \
    -out $1.com.csr

cp v3.ext  v3.1.ext

sed -i "s/yourdomain/$1/g" v3.1.ext
sed -i "s/hostname/$org/g" v3.1.ext

openssl x509 -req -sha512 -days 3650 \
    -extfile v3.1.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in $1.com.csr \
    -out $1.com.crt

mkdir -p /data/cert/
cp $1.com.crt /data/cert/
cp $1.com.key /data/cert/
openssl x509 -inform PEM -in $1.com.crt -out $1.com.cert

mkdir -p /etc/docker/certs.d/$1.com/
cp $1.com.cert /etc/docker/certs.d/$1.com/
cp $1.com.key /etc/docker/certs.d/$1.com/
cp ca.crt /etc/docker/certs.d/$1.com/