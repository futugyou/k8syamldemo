resource "aws_cloud9_environment_ec2" "cloud9" {
  name                        = var.cloud9_name
  instance_type               = "t2.micro"
  automatic_stop_time_minutes = 30
  image_id ="amazonlinux-2-x86_64"
}
