// nat gateway, it allocation an eip ,so is 'public nat gateway'
resource "aws_nat_gateway" "nat-cicd" {
  allocation_id = aws_eip.cicd-eipalloc.id
  subnet_id     = aws_subnet.cicd-subnet-public[0].id
  tags = {
    "Name" = format("%s-ngw", var.cicd-vpc-name)
  }
}
