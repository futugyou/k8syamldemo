resource "aws_ssm_parameter" "AppSetting-Session" {
  data_type = "text"
  key_id    = "alias/aws/ssm"
  name      = "/AppSetting/Session"
  tier      = "Standard"
  type      = "SecureString"
  value     = "{\n\"ExpiryTime\":86400\n}"
}