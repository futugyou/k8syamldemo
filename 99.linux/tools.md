# Linux tools

## 将内外网进行映射. 10.0.0.4内 52.230.46.84外

```shell
iptables -t nat -A OUTPUT -d 10.0.0.4 -j DNAT --to-destination 52.230.46.84
```

## export

```shell
vi /etc/profile
export PATH=/bin/:$PATH
source /etc/profile
```

## tee write 

```shell
cat <<EOF | tee /etc/modules-load.d/containerd.conf
overlay
EOF

tee /etc/modules-load.d/containerd.conf >/dev/null <<EOF
overlay
EOF
```

## tar,zip

```shell
tar -xzvf kubernetes-server-linux-amd64.tar.gz
unzip -o fastgithub_linux-x64.zip -d ./ 
```

## ln

```shell
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

##  public key is not available: NO_PUBKEY 

```shell
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
```

## Hostname

```shell
hostnamectl set-hostname master01 --static
vi /etc/hosts
```

## job ,use &

```shell
jobs -l
kill pid
```


## error: mbed TLS libraries not found

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

## net namespace

```shell
lsns -t net
```

## process namespace

```shell
lsns -t pid
eg. PID 129889
```

## identify namespace

```shell
ip netns identify 129889
eg. cni-607c5530-b6d8-ba57-420e-a467d7b10c56
```

## netns

```shell
ip netns exec cni-607c5530-b6d8-ba57-420e-a467d7b10c56 ip a
eg. eth0@if17
```

## interface info

```shell
ip link | grep -A1 ^17
```

## root user

```shell
sudo passwd root
su root
vi /etc/ssh/sshd_config
sudo /sbin/service sshd restart
```

## count `file` in dir, if you want count `dir`, change `-type f` to `-type d`

```shell
for dir in /workspace/bmw/*/; do
  count=$(find "$dir" -maxdepth 1 -type f | wc -l)
  echo -e "$count\t$dir"
done | sort -n
```

## change dir names

```shell
for dir in /workspace/bmw/*/; do
  base=$(basename "$dir")
  newname="${base%-master}"
  newname="${newname%-main}"
  if [ "$base" != "$newname" ]; then
    mv "$dir" "/workspace/bmw/$newname"
  fi
done
```

## delete .github folder and sub folders

```shell
find /workspace/bmw -type d -name ".github" -exec rm -rf {} +
```

## find .tf file

```shell
for dir in /workspace/bmw/*/; do
  if find "$dir" -maxdepth 1 -type f -name "*.tf" | grep -q .; then
    echo "目录 $dir 存在 .tf 文件"
  else
    echo "目录 $dir 不存在 .tf 文件"
  fi
done
```

## group folder name and count it

```shell
for dir in  /workspace/bmw/*/; do
  basename "$dir" | cut -d'-' -f1
done | sort -u

for dir in /workspace/bmw/*/; do
  basename "$dir" | cut -d'-' -f1
done | sort | uniq -c | sort -n
```
