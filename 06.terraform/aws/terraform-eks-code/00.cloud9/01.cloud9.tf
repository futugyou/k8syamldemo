// https://tf-eks-workshop.workshop.aws/020_prerequisites/workspaceiam.html
resource "aws_cloud9_environment_ec2" "cloud9" {
  name                        = var.cloud9_name
  connection_type             = "CONNECT_SSM"
  instance_type               = "t3.small"
  automatic_stop_time_minutes = 60
  image_id                    = "amazonlinux-2-x86_64"
}
