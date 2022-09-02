resource "aws_security_group" "cluster-sg" {
  description = "Communication between the control plane and worker nodegroups"
  vpc_id      = aws_vpc.cluster.id
  tags = {
    "Name"  = format("%s-cluster/ControlPlaneSecurityGroup", var.cluster-name)
    "Label" = "TF-EKS Control Plane & all worker nodes comms"
  }
}

output "cluster-sg" {
  value = aws_security_group.cluster-sg.id
}

resource "aws_security_group" "allnodes-sg" {
  description = "Communication between all nodes in the cluster"
  vpc_id      = aws_vpc.cluster.id
  tags = {
    "Name"  = format("%s-cluster/ClusterSharedNodeSecurityGroup", var.cluster-name)
    "Label" = "TF-EKS All Nodes Comms"
  }
}

output "allnodes-sg" {
  value = aws_security_group.allnodes-sg.id
}

resource "aws_security_group" "control-plane-sg" {
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."
  vpc_id      = aws_vpc.cluster.id
  tags = {
    "Name"                                      = format("%s-cluster-control-plane-sg", var.cluster-name)
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
    "Label"                                     = "TF-EKS Control Plane + Managed node ENI's"
  }
}
