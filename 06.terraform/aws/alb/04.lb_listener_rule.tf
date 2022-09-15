resource "aws_lb_listener_rule" "listener_rule" {
  action {
    order            = "1"
    target_group_arn = aws_lb_target_group.target_group.arn
    type             = "forward"
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }

  listener_arn = aws_lb_listener.lb_listener.arn
  priority     = "1"
}
