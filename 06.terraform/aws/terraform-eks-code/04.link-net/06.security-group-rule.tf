// security for cloud9
resource "aws_security_group_rule" "sg-def-22" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc-eks.cidr_block]
  security_group_id = data.aws_security_group.cloud9-sg.id
}

resource "aws_security_group_rule" "sg-def-eks-all" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc-eks.cidr_block]
  security_group_id = data.aws_security_group.cloud9-sg.id
}

// security for cicd
resource "aws_security_group_rule" "sg-cicd-22" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc-eks.cidr_block]
  security_group_id = data.aws_security_group.cicd-sg.id
}

resource "aws_security_group_rule" "sg-cicd-eks-all" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc-eks.cidr_block]
  security_group_id = data.aws_security_group.cicd-sg.id
}

resource "aws_security_group_rule" "sg-cicd-self" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  self              = true
  security_group_id = data.aws_security_group.cicd-sg.id
}

resource "aws_security_group_rule" "sg-cicd-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = data.aws_security_group.cicd-sg.id
}

// security for eks
resource "aws_security_group_rule" "eks-all" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc-default.cidr_block]
  security_group_id = data.aws_security_group.cluster-sg.id
}

resource "aws_security_group_rule" "eks-all-cicd" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc-cicd.cidr_block]
  security_group_id = data.aws_security_group.cluster-sg.id
}

resource "aws_security_group_rule" "eks-all-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = data.aws_security_group.cluster-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "eks-node" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc-default.cidr_block]
  security_group_id = data.aws_security_group.allnodes-sg.id
}


resource "aws_security_group_rule" "eks-node-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = data.aws_security_group.allnodes-sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "eks-all-node" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = data.aws_security_group.allnodes-sg.id
  security_group_id        = data.aws_security_group.cluster-sg.id
}

resource "aws_security_group_rule" "eks-node-all" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = data.aws_security_group.cluster-sg.id
  security_group_id        = data.aws_security_group.allnodes-sg.id
}

resource "aws_security_group_rule" "eks-all-self" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  self              = true
  security_group_id = data.aws_security_group.cluster-sg.id
}

resource "aws_security_group_rule" "eks-node-self" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  self              = true
  security_group_id = data.aws_security_group.allnodes-sg.id
}
