resource "aws_kms_key" "efskey" {
  description = format("EFS KMS Key %s", var.efs_name)
}

resource "aws_efs_file_system" "file_system" {
  kms_key_id     = aws_kms_key.efskey.arn
  creation_token = var.efs_name
  encrypted      = true

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name = var.efs_name
  }
}
