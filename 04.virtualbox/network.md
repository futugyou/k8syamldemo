#/etc/sysconfig/network-scripts/ifcfg-enp0s3
```
TYPE="Ethernet"
PROXY_METHOD="none"
BROWSER_ONLY="no"
############改动部分开始############
#动态IP
#BOOTPROTO="dhcp"
 
#静态IP
BOOTPROTO="static"
IPADDR=192.168.15.137
NETMASK=255.255.255.0
GATEWAY=192.168.15.1
DNS2=8.8.8.8
DNS1=114.114.114.114
############改动部分结束############
DEFROUTE="yes"
IPV4_FAILURE_FATAL="no"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
IPV6_DEFROUTE="yes"
IPV6_FAILURE_FATAL="no"
IPV6_ADDR_GEN_MODE="stable-privacy"
NAME="enp0s3"
UUID="73ab5a69-9070-4c5a-a0b9-c5a6250af943"
DEVICE="enp0s3"
ONBOOT="yes"

systemctl  restart network
```
#vi /etc/resolv.conf