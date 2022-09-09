data "aws_vpc" "cicd" {
  default = false
  filter {
    name   = "tag:workshop"
    values = [var.cicd-vpc-name]
  }
}

data "aws_subnet" "cicd" {
  filter {
    name   = "tag:workshop"
    values = [var.cicd-subnet-tag]
  }
}

data "aws_security_group" "cicd" {
  vpc_id = data.aws_vpc.cicd.id

  filter {
    name   = "tag:workshop"
    values = [var.cicd-vpc-name]
  }
}

data "aws_kms_alias" "s3" {
  name = "alias/aws/s3"
}

data "aws_caller_identity" "current" {}

data "aws_s3_bucket" "codepipeline" {
  bucket = "terraform-eks-code"
}
