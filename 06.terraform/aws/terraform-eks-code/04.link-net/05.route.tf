resource "aws_route" "rt-cicd" {
  route_table_id            = data.aws_route_table.cicd-rtb.id
  destination_cidr_block    = data.aws_vpc.vpc-eks.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.cicd-peer.id
}

resource "aws_route" "rt-def-cicd" {
  route_table_id            = data.aws_vpc.vpc-cicd.main_route_table_id
  destination_cidr_block    = data.aws_vpc.vpc-eks.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.cicd-peer.id
}

resource "aws_route" "rt-def" {
  route_table_id            = data.aws_vpc.vpc-default.main_route_table_id
  destination_cidr_block    = data.aws_vpc.vpc-eks.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}

resource "aws_route" "rt-default-eksprivate" {
  count = length(data.aws_route_tables.private-rts.ids)

  route_table_id            = tolist(data.aws_route_tables.private-rts.ids)[count.index]
  destination_cidr_block    = data.aws_vpc.vpc-default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}

resource "aws_route" "rt-cicd-eksprivate" {
  count = length(data.aws_route_tables.private-rts.ids)

  route_table_id            = tolist(data.aws_route_tables.private-rts.ids)[count.index]
  destination_cidr_block    = data.aws_vpc.vpc-cicd.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.cicd-peer.id
}


resource "aws_route" "rt-default-eksisolated" {
  route_table_id            = data.aws_route_table.isolated.id
  destination_cidr_block    = data.aws_vpc.vpc-default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}

resource "aws_route" "rt-cicd-eksisolated" {
  route_table_id            = data.aws_route_table.isolated.id
  destination_cidr_block    = data.aws_vpc.vpc-cicd.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.cicd-peer.id
}
