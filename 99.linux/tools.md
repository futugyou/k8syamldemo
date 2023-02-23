###### 将内外网进行映射. 10.0.0.4内 52.230.46.84外
```
iptables -t nat -A OUTPUT -d 10.0.0.4 -j DNAT --to-destination 52.230.46.84
```

###### export
```
vi /etc/profile
export PATH=/bin/:$PATH
source /etc/profile
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

###### tar,zip
```
tar -xzvf kubernetes-server-linux-amd64.tar.gz
unzip -o fastgithub_linux-x64.zip -d ./ 
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


### error: mbed TLS libraries not found
```shell
wget https://tls.mbed.org/download/mbedtls-2.16.3-gpl.tgz
or
wget https://down.24kplus.com/linux/mbedtls/mbedtls-2.16.3-gpl.tgz
tar -xf mbedtls-2.16.3-gpl.tgz
cd mbedtls-2.16.3

make
make DESTDIR=/usr install
ldconfig

```

### net namespace
```
lsns -t net
```
### process namespace
```
lsns -t pid
eg. PID 129889
```
### identify namespace
```
ip netns identify 129889
eg. cni-607c5530-b6d8-ba57-420e-a467d7b10c56
```
### netns
```
ip netns exec cni-607c5530-b6d8-ba57-420e-a467d7b10c56 ip a
eg. eth0@if17
```
### interface info
```
ip link | grep -A1 ^17
```

### root user
```
sudo passwd root
su root
vi /etc/ssh/sshd_config
sudo /sbin/service sshd restart
```