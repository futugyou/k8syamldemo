locals {
  // this is for jsondecode/jsonencode demo, in product those two function can omit
  json_data = jsondecode(file("${path.module}/json-values.json"))
  // this is for yamldecode/yamlencode demo, in product those two function can omit
  yaml_data = yamldecode(file("${path.module}/yaml-values.yaml"))
}

resource "aws_ssm_parameter" "AppSetting-Session" {
  data_type = "text"
  key_id    = "alias/aws/ssm"
  name      = "/AppSetting/Session"
  tier      = "Standard"
  type      = "SecureString"
  value     = "{\n\"ExpiryTime\":86400\n}"
}

resource "aws_ssm_parameter" "read-json" {
  data_type = "text"
  key_id    = "alias/aws/ssm"
  name      = "/AppSetting/ReadJson"
  tier      = "Standard"
  type      = "SecureString"
  value     = jsonencode(local.json_data)
}


resource "aws_ssm_parameter" "read-yaml" {
  data_type = "text"
  key_id    = "alias/aws/ssm"
  name      = "/AppSetting/ReadYaml"
  tier      = "Standard"
  type      = "SecureString"
  value     = yamlencode(local.yaml_data)
}
