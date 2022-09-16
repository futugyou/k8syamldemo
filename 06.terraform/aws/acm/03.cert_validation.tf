resource "aws_acm_certificate_validation" "acm_cert_validation" {
  count = var.wait_for_validation ? 1 : 0

  certificate_arn         = aws_acm_certificate.acm_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.route53_record : record.fqdn]
}
