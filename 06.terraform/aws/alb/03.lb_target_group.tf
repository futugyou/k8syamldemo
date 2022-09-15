resource "aws_lb_target_group" "target_group" {
  name                          = var.aws_lb_name
  target_type                   = "ip"
  port                          = 80
  protocol                      = "HTTP"
  load_balancing_algorithm_type = "round_robin"
  vpc_id                        = data.aws_vpc.ecs_vpc.id
  health_check {
    path = "/health"
  }
}
