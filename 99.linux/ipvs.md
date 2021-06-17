[original EN](https://dustinspecker.com/posts/ipvs-how-kubernetes-services-direct-traffic-to-pods/)

[翻译 CH](https://www.cnblogs.com/ryanyangcs/p/14888443.html)
  
###### allow ip forward
```
sysctl --write net.ipv4.ip_forward=1
```
###### 创建一个虚拟网桥 bridge_home
```
ip link add dev bridge_home type bridge
ip address add 10.0.0.1/24 dev bridge_home
```
##### 创建网络命名空间 netns_dustin, 配置 DNS
```
ip netns add netns_dustin
mkdir -p /etc/netns/netns_dustin
echo "nameserver 8.8.8.8" | tee -a /etc/netns/netns_dustin/resolv.conf
ip netns exec netns_dustin ip link set dev lo up
```
##### 给 netns_dustin 网络命名空间中的 veth 设备分配一个 IP 地址为 10.0.0.11
```
ip link add dev veth_dustin type veth peer name veth_ns_dustin
ip link set dev veth_dustin master bridge_home
ip link set dev veth_dustin up
ip link set dev veth_ns_dustin netns netns_dustin
ip netns exec netns_dustin ip link set dev veth_ns_dustin up
ip netns exec netns_dustin ip address add 10.0.0.11/24 dev veth_ns_dustin
```
##### 创建网络命名空间 netns_leah, 配置 DNS
```
ip netns add netns_leah
mkdir -p /etc/netns/netns_leah
echo "nameserver 8.8.8.8" | tee -a /etc/netns/netns_leah/resolv.conf
ip netns exec netns_leah ip link set dev lo up
```
##### 给 netns_leah 网络命名空间中的 veth 设备分配一个 IP 地址为 10.0.021
```
ip link add dev veth_leah type veth peer name veth_ns_leah
ip link set dev veth_leah master bridge_home
ip link set dev veth_leah up
ip link set dev veth_ns_leah netns netns_leah
ip netns exec netns_leah ip link set dev veth_ns_leah up
ip netns exec netns_leah ip address add 10.0.0.21/24 dev veth_ns_leah
```
##### 为每个网络命名空间设定默认路由
```
ip link set bridge_home up
ip netns exec netns_dustin ip route add default via 10.0.0.1
ip netns exec netns_leah ip route add default via 10.0.0.1
```
##### 添加 iptables 规则，允许流量进出 bridge_home 接口
```
iptables --table filter --append FORWARD --in-interface bridge_home --jump ACCEPT
iptables --table filter --append FORWARD --out-interface bridge_home --jump ACCEPT
```
##### 添加 iptables 规则，针对 10.0.0.0/24 网段进行流量伪装
```
iptables --table nat --append POSTROUTING --source 10.0.0.0/24 --jump MASQUERADE
```

##### In another terminal run
```
ip netns exec netns_dustin python3 -m http.server 8080
```
##### Open another terminal and run
```
ip netns exec netns_leah python3 -m http.server 8080
```
##### Verify the following commands all succeed
```
curl 10.0.0.11:8080
curl 10.0.0.21:8080
ip netns exec netns_dustin curl 10.0.0.21:8080
ip netns exec netns_leah curl 10.0.0.11:8080
```
##### install two tools, ipvsadm and ipset.
```
yum install ipset ipvsadm

```
##### Create a virtual service via IPVS,
##### Some Error: The first command will expire in a short time, like 'Service not defined'
```
ipvsadm --add-service --tcp-service 10.100.100.100:8080 --scheduler rr
ipvsadm --add-server  --tcp-service 10.100.100.100:8080 --real-server 10.0.0.11:8080 --masquerading
curl 10.100.100.100:8080
```
##### creates a virtual device that is a dummy type
```
ip link add dev dustin-ipvs0 type dummy
ip addr add 10.100.100.100/32 dev dustin-ipvs0
modprobe br_netfilter
sysctl --write net.bridge.bridge-nf-call-iptables=1
ip netns exec netns_leah curl 10.100.100.100:8080
```
##### Enable hairpin connections
```
brctl hairpin bridge_home veth_dustin on
sysctl --write net.ipv4.vs.conntrack=1
ip netns exec netns_dustin curl 10.100.100.100:8080
```
##### The bridge turns on promiscuous mode
```
ip link set bridge_home promisc on
```
##### Improve masquerade usage
```
iptables --table nat --delete POSTROUTING --source 10.0.0.0/24 --jump MASQUERADE
iptables --table nat --append POSTROUTING --source 10.0.0.11/32 --jump MASQUERADE
```
##### use ipset
```
iptables --table nat --delete POSTROUTING --source 10.0.0.11/32 --jump MASQUERADE
ipset create DUSTIN-LOOP-BACK hash:ip,port,ip
ipset add DUSTIN-LOOP-BACK 10.0.0.11,tcp:8080,10.0.0.11
iptables --table nat --append POSTROUTING --match set --match-set DUSTIN-LOOP-BACK dst,dst,src --jump MASQUERADE
```
##### Add another server to the virtual service
```
ipvsadm --add-server --tcp-service 10.100.100.100:8080 --real-server 10.0.0.21:8080 --masquerading
ipset add DUSTIN-LOOP-BACK 10.0.0.21,tcp:8080,10.0.0.21
curl 10.100.100.100:8080
ipvsadm -Ln
```