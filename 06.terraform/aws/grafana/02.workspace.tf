resource "aws_grafana_workspace" "workspace" {
  name                      = var.grafana_name
  account_access_type       = "CURRENT_ACCOUNT"
  authentication_providers  = ["SAML"]
  permission_type           = "SERVICE_MANAGED"
  role_arn                  = aws_iam_role.assume.arn
  data_sources              = ["CLOUDWATCH", "XRAY"]
  notification_destinations = ["SNS"]
  tags = {
    name = var.grafana_name
  }
}
