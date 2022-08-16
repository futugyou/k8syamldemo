resource "aws_elb" "main" {
  name               = "cloud-map-service-elb"
  availability_zones = ["ap-southeast-1c"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}


resource "aws_route53_record" "service-record" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "identity.com"
  type    = "A"

  alias {
    name                   = aws_elb.main.dns_name
    zone_id                = aws_elb.main.zone_id
    evaluate_target_health = true
  }
}
