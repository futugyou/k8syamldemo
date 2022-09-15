resource "aws_lb_listener" "lb_listener" {
  //certificate_arn = aws_acm_certificate_validation.acm_cert_validation.certificate_arn

  default_action {
    fixed_response {
      content_type = "text/plain"
      status_code  = "503"
    }

    order = "1"
    type  = "fixed-response"
  }

  port       = "80"
  protocol   = "HTTP"
  //ssl_policy = "ELBSecurityPolicy-2016-08"

  load_balancer_arn = aws_lb.alb.arn
}
