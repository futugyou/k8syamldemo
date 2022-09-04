data "aws_security_group" "cicd-sg" {
  vpc_id = data.aws_vpc.vpc-cicd.id
  filter {
    name   = "tag:workshop"
    values = [var.cicd-vpc-name]
  }
}

data "aws_instance" "cloud9-ec2" {
  filter {
    name   = "tag:Name"
    values = ["*${var.cloud9-label}*"]
  }
}

data "aws_security_group" "cloud9-sg" {
  name = sort(data.aws_instance.cloud9-ec2.security_groups)[0]
}

data "aws_iam_instance_profile" "cloud9-ec2-profile" {
  name = data.aws_instance.cloud9-ec2.iam_instance_profile
}
