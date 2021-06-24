###### 将内外网进行映射. 10.0.0.4内 52.230.46.84外
```
iptables -t nat -A OUTPUT -d 10.0.0.4 -j DNAT --to-destination 52.230.46.84
```

###### export
```
export PATH=/bin/:$PATH
```

###### tee write 
```
cat <<EOF | tee /etc/modules-load.d/containerd.conf
overlay
EOF

tee /etc/modules-load.d/containerd.conf >/dev/null <<EOF
overlay
EOF
```

###### tar
```
tar -xzvf kubernetes-server-linux-amd64.tar.gz
```

###### ln
```
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

######  public key is not available: NO_PUBKEY 
```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
```

### Hostname
```
hostnamectl set-hostname master01 --static
vi /etc/hosts
```

### job ,use &
```
jobs -l
kill pid
```