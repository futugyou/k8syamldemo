// internet gateway
resource "aws_internet_gateway" "cicd-igw" {
  tags = {
    "Name" = format("%s-igw", var.cicd-vpc-name)
  }
  vpc_id = aws_vpc.vpc-cicd.id
}
