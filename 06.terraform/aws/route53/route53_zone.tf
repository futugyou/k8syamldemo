resource "aws_route53_zone" "primary" {
  comment       = ""
  force_destroy = "false"
  name          = "internal.gateway.com"

  vpc {
    vpc_id     = "vpc-01de25ab26f027bf5"
    vpc_region = "ap-southeast-1"
  }
}
