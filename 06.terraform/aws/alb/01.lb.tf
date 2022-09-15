resource "aws_lb" "alb" {
  desync_mitigation_mode     = "defensive"
  drop_invalid_header_fields = "false"
  enable_deletion_protection = "false"
  enable_http2               = "true"
  enable_waf_fail_open       = "false"

  idle_timeout       = "60"
  internal           = "false"
  ip_address_type    = "ipv4"
  load_balancer_type = "application"

  name            = var.aws_lb_name
  security_groups = [data.aws_security_group.alb_security.id]
  subnets         = data.aws_subnets.alb_subnet.ids
}
