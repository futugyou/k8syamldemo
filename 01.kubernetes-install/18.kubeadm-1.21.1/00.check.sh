#!/usr/bin/env bash

# Get MAC
ifconfig -a
# uuid
cat /sys/class/dmi/id/product_uuid
# br_netfilter
cat <<EOF | tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

cat <<EOF | tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

modprobe overlay 
modprobe br_netfilter

cat <<EOF | tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
vm.swappiness=0
EOF

cat <<EOF | tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
vm.swappiness=0
EOF

sysctl --system

update-alternatives --set iptables /usr/sbin/iptables-legacy
update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
update-alternatives --set arptables /usr/sbin/arptables-legacy
update-alternatives --set ebtables /usr/sbin/ebtables-legacy

#ipv4
baseDirForScriptSelf=$(cd "$(dirname "$0")"; pwd)
cat <<EOF | tee /etc/rc.local
${baseDirForScriptSelf}/ipvs.sh
EOF
chmod +x /etc/rc.local
iptables -P FORWARD ACCEPT
lsmod |grep ip_vs