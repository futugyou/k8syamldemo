
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "log_groups" {
  content  = aws_cloudwatch_log_group.log_group_for_lambda.arn
  filename = "./upload/og_group_for_lambda.arn.txt"
}

resource "local_sensitive_file" "sensitive_file" {
  content  = tls_private_key.private_key.private_key_pem
  filename = "./upload/private_key.pem"
}

output "ec2_bridge_private_key" {
  value     = trimspace(tls_private_key.private_key.private_key_pem)
  sensitive = true
}

output "ec2_bridge_public_key" {
  value = tls_private_key.private_key.public_key_openssh
}
