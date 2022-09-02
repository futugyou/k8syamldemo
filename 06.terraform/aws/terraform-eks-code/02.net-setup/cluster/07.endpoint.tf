// this type is 'Gateway'
resource "aws_vpc_endpoint" "gateway-endpoint" {
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
resource "aws_vpc_endpoint" "interface-endpoint" {
  count = length(var.endpoint-list)

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
  service_name = format("com.amazonaws.%s.%s", data.aws_region.current.name, element(var.endpoint-list, count.index))
  subnet_ids   = aws_subnet.additional-subnet[*].id
  tags = {
    "Name" = format("%s-%s", var.cluster-name, element(var.endpoint-list, count.index))
  }
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.cluster.id

  timeouts {}
}
