// this sub net provide for pods
resource "aws_vpc_ipv4_cidr_block_association" "vpc-cidr-assoc" {
  cidr_block = var.additional-cidr
  vpc_id     = aws_vpc.cluster.id

  timeouts {}
}