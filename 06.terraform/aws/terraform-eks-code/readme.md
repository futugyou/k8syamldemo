### [Document](https://tf-eks-workshop.workshop.aws/)

##### CIDR 无类别域间路由（Classless Inter-Domain Routing）是一个用于给用户分配IP地址以及在互联网上有效地路由IP数据包的对IP地址进行归类的方法。
##### ACL 网络访问控制列表(ACL)是 VPC 的可选安全层，可作为防火墙来控制进出一个或多个子网的流量。
##### VPC 终端节点(endpoint)支持 Virtual Private Cloud (VPC) 与受支持的服务之间的连接，而无需您使用互联网网关、NAT 设备、VPN 连接或 AWS Direct Connect 连接。因此，您的 VPC 不会暴露在公共互联网上。
##### internet gateway 互联网网关是一种横向扩展、冗余且高度可用的 VPC 组件，支持在 VPC 和 Internet 之间进行通信。
##### public subnet 如果子网的关联路由表(route table)包含指向互联网网关(internet gateway)的路由，则该子网称为公有子网
##### private subnet 如果子网的关联路由表(route table)没有指向互联网网关(internet gateway)的路由，则该子网称为私有子网。
##### nat gateway 是一种网络地址转换 (NAT) 服务。使用 NAT 网关，以便私有子网中的实例可以连接到 VPC 外部的服务，但外部服务无法启动与这些实例的连接。
##### elastic ip 弹性 IP 地址是公有 IPv4 地址，可通过 Internet 访问。
