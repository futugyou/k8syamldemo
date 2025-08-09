# CentOS7

## use root

```shell
su
```

## show kernel verion

```shell
uname -rs
```

## import source

```shell
yum install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm
yum install https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
```

## look at package

```shell
yum  --disablerepo="*"  --enablerepo="elrepo-kernel"  list  available
```

## choose ml

```shell
yum  --enablerepo=elrepo-kernel  install  kernel-ml -y 
```

## choose lt

```shell
yum --enablerepo=elrepo-kernel install kernel-lt -y 
```

## change start order

```shell
grub2-set-default  0 && grub2-mkconfig -o /etc/grub2.cfg
grubby --args="user_namespace.enable=1" --update-kernel="$(grubby --default-kernel)"
```

## show defalut version

```shell
grubby --default-kernel
```

## set host name

```shell
hostnamectl set-hostname master01
```

## set source (centos7/8)

```shell
sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo
sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org/$contentdir|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo

```

## useful tools

```shell
yum -y install socat conntrack ebtables wget jq psmisc vim net-tools nfs-utils telnet yum-utils device-mapper-persistent-data lvm2 git network-scripts tar curl -y
```

## close firewalld、selinux、dnsmasq、swap

```shell
systemctl disable --now firewalld 
systemctl disable --now dnsmasq
systemctl disable --now NetworkManager

setenforce 0
sed -i 's#SELINUX=enforcing#SELINUX=disabled#g' /etc/sysconfig/selinux
sed -i 's#SELINUX=enforcing#SELINUX=disabled#g' /etc/selinux/config
swapoff -a && sysctl -w vm.swappiness=0
sed -ri '/^[^#]*swap/s@^@#@' /etc/fstab
cat /etc/fstab
```

## close manager and start network

```shell
systemctl disable --now NetworkManager
systemctl start network && systemctl enable network
```

## time sync

```shell
rpm -ivh http://mirrors.wlnmp.com/centos/wlnmp-release-centos.noarch.rpm
yum install ntpdate -y
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo 'Asia/Shanghai' >/etc/timezone
ntpdate time2.aliyun.com
# 加入到crontab
vi synctime.txt
*/5 * * * * /usr/sbin/ntpdate time2.aliyun.com

crontab synctime.txt
```

## limit

```shell
ulimit -SHn 65535
cat >> /etc/security/limits.conf <<EOF
* soft nofile 655360
* hard nofile 131072
* soft nproc 655350
* hard nproc 655350
* seft memlock unlimited
* hard memlock unlimitedd
EOF
```

## no  password

```shell
ssh-keygen -t rsa
for i in master01 node01 node02;do ssh-copy-id -i .ssh/id_rsa.pub $i;done
```

## ipvsadm

```shell
yum install ipvsadm ipset sysstat conntrack libseccomp -y

cat >> /etc/modules-load.d/ipvs.conf <<EOF 
ip_vs
ip_vs_lc
ip_vs_wlc
ip_vs_rr
ip_vs_wrr
ip_vs_lblc
ip_vs_lblcr
ip_vs_dh
ip_vs_sh
ip_vs_fo
ip_vs_nq
ip_vs_sed
ip_vs_ftp
nf_conntrack
ip_tables
ip_set
xt_set
ipt_set
ipt_rpfilter
ipt_REJECT
ipip
EOF

systemctl enable --now systemd-modules-load.service
systemctl restart systemd-modules-load.service
```

## is not in the sudoers file. This incident will be reported

```shell
su root
chmod 777 /etc/sudoers
vi /etc/sudoers

add:
username ALL=(ALL)ALL

chmod 440 /etc/sudoers
```

## can ssh, can not ping

```shell
ifconfig ens33 up
dhclient ens33 
ifconfig ens33
```

## user

```shell
adduser node02
passwd node02
```
