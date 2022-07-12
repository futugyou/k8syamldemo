resource "aws_security_group" "eks-sg-22" {
  name        = format("eks-sg-22-%s",var.cluster_name) 
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = var.ingress_security_group_rule
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = format("eks-sg-22-%s",var.cluster_name) 
  }
}
 
resource "aws_security_group" "eks-cluster" {
  name        = format("eks-cluster-%s",var.cluster_name) 
  description = "Allow local vpc"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.ingress_security_group_rule
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = format("eks-cluster-%s",var.cluster_name) 
  }
}

resource "aws_security_group" "eks-node" {
  name        = format("eks-node-%s",var.cluster_name) 
  description = "Allow local vpc"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.ingress_security_group_rule
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = format("eks-node-%s",var.cluster_name) 
  }
}

resource "aws_security_group" "eks-default" {
  name        = format("eks-default-%s",var.cluster_name)
  vpc_id      = module.vpc.vpc_id
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

   tags = {
    Name = format("eks-default-%s",var.cluster_name) 
  }
}