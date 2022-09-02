resource "aws_security_group" "eks-cicd-sg" {
  description = "eks-cicd all"
  vpc_id      = aws_vpc.vpc-cicd.id
  tags = {
    "Name"     = format("%s-all", var.cicd-vpc-name)
    "workshop" = var.cicd-vpc-name
  }
}
