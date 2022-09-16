
resource "aws_acm_certificate" "acm_cert" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  subject_alternative_names = [var.domain_name]

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }

  lifecycle {
    create_before_destroy = true
  }
}
