output "aws_route53_record_service_record" {
  value = "${aws_route53_record.service-record.id}"
}

output "aws_route53_zone_id" {
  value = "${aws_route53_zone.primary.id}"
}
