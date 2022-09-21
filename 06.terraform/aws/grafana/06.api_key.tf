resource "aws_grafana_workspace_api_key" "key" {
  key_name        = "api-key"
  key_role        = "VIEWER"
  seconds_to_live = 3600
  workspace_id    = aws_grafana_workspace.workspace.id
}
