// this type is 'Gateway'
resource "aws_vpc_endpoint" "vpce-s3" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
      Version = "2008-10-17"
    }
  )
  private_dns_enabled = false
  route_table_ids     = concat([aws_route_table.isolated-rtb.id], aws_route_table.private-rtb[*].id)
  security_group_ids  = []
  service_name        = format("com.amazonaws.%s.s3", data.aws_region.current.name)
  subnet_ids          = []
  tags = {
    "Name" = format("%s-s3", var.cluster-name)
  }
  vpc_endpoint_type = "Gateway"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}

// this type is 'Interface'
resource "aws_vpc_endpoint" "vpce-autoscaling" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
    }
  )
  private_dns_enabled = true
  route_table_ids     = []
  security_group_ids = [
    aws_security_group.allnodes-sg.id,
    aws_security_group.cluster-sg.id
  ]
  service_name = format("com.amazonaws.%s.autoscaling", data.aws_region.current.name)
  subnet_ids   = aws_subnet.additional-subnet[*].id
  tags = {
    "Name" = format("%s-autoscaling", var.cluster-name)
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}

resource "aws_vpc_endpoint" "vpce-ec2" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
    }
  )
  private_dns_enabled = true
  route_table_ids     = []
  security_group_ids = [
    aws_security_group.allnodes-sg.id,
    aws_security_group.cluster-sg.id
  ]
  service_name = format("com.amazonaws.%s.ec2", data.aws_region.current.name)
  subnet_ids   = aws_subnet.additional-subnet[*].id
  tags = {
    "Name" = format("%s-ec2", var.cluster-name)
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}


resource "aws_vpc_endpoint" "vpce-ec2messages" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
    }
  )
  private_dns_enabled = true
  route_table_ids     = []
  security_group_ids = [
    aws_security_group.allnodes-sg.id,
    aws_security_group.cluster-sg.id
  ]
  service_name = format("com.amazonaws.%s.ec2messages", data.aws_region.current.name)
  subnet_ids   = aws_subnet.additional-subnet[*].id
  tags = {
    "Name" = format("%s-ec2messages", var.cluster-name)
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}

resource "aws_vpc_endpoint" "vpce-ecrapi" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
    }
  )
  private_dns_enabled = true
  route_table_ids     = []
  security_group_ids = [
    aws_security_group.allnodes-sg.id,
    aws_security_group.cluster-sg.id
  ]
  service_name = format("com.amazonaws.%s.ecr.api", data.aws_region.current.name)
  subnet_ids   = aws_subnet.additional-subnet[*].id
  tags = {
    "Name" = format("%s-ecr.api", var.cluster-name)
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}

resource "aws_vpc_endpoint" "vpce-ecrdkr" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
    }
  )
  private_dns_enabled = true
  route_table_ids     = []
  security_group_ids = [
    aws_security_group.allnodes-sg.id,
    aws_security_group.cluster-sg.id
  ]
  service_name = format("com.amazonaws.%s.ecr.dkr", data.aws_region.current.name)
  subnet_ids   = aws_subnet.additional-subnet[*].id
  tags = {
    "Name" = format("%s-ecr.dkr", var.cluster-name)
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}

resource "aws_vpc_endpoint" "vpce-elb" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
    }
  )
  private_dns_enabled = true
  route_table_ids     = []
  security_group_ids = [
    aws_security_group.allnodes-sg.id,
    aws_security_group.cluster-sg.id
  ]
  service_name = format("com.amazonaws.%s.elasticloadbalancing", data.aws_region.current.name)
  subnet_ids   = aws_subnet.additional-subnet[*].id
  tags = {
    "Name" = format("%s-elasticloadbalancing", var.cluster-name)
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}

resource "aws_vpc_endpoint" "vpce-logs" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
    }
  )
  private_dns_enabled = true
  route_table_ids     = []
  security_group_ids = [
    aws_security_group.allnodes-sg.id,
    aws_security_group.cluster-sg.id
  ]
  service_name = format("com.amazonaws.%s.logs", data.aws_region.current.name)
  subnet_ids   = aws_subnet.additional-subnet[*].id
  tags = {
    "Name" = format("%s-logs", var.cluster-name)
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}

resource "aws_vpc_endpoint" "vpce-ssm" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
    }
  )
  private_dns_enabled = true
  route_table_ids     = []
  security_group_ids = [
    aws_security_group.allnodes-sg.id,
    aws_security_group.cluster-sg.id
  ]
  service_name = format("com.amazonaws.%s.ssm", data.aws_region.current.name)
  subnet_ids   = aws_subnet.additional-subnet[*].id
  tags = {
    "Name" = format("%s-ssm", var.cluster-name)
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}

resource "aws_vpc_endpoint" "vpce-ssmmessages" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
    }
  )
  private_dns_enabled = true
  route_table_ids     = []
  security_group_ids = [
    aws_security_group.allnodes-sg.id,
    aws_security_group.cluster-sg.id
  ]
  service_name = format("com.amazonaws.%s.ssmmessages", data.aws_region.current.name)
  subnet_ids   = aws_subnet.additional-subnet[*].id
  tags = {
    "Name" = format("%s-ssmmessages", var.cluster-name)
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}

resource "aws_vpc_endpoint" "vpce-sts" {
  policy = jsonencode(
    {
      Statement = [
        {
          Action    = "*"
          Effect    = "Allow"
          Principal = "*"
          Resource  = "*"
        },
      ]
    }
  )
  private_dns_enabled = true
  route_table_ids     = []
  security_group_ids = [
    aws_security_group.allnodes-sg.id,
    aws_security_group.cluster-sg.id
  ]
  service_name = format("com.amazonaws.%s.sts", data.aws_region.current.name)
  subnet_ids   = aws_subnet.additional-subnet[*].id
  tags = {
    "Name" = format("%s-sts", var.cluster-name)
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}
