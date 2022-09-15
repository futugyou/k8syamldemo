data "aws_vpc" "ecs_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_tag]
  }
}

data "aws_security_group" "alb_security" {
  name = var.alb_security_group_name
}

data "aws_subnets" "alb_subnet" {
  filter {
    name   = "tag:Name"
    values = [format("%s*", var.alb_subnet_prefix)]
  }
}
