resource "aws_iam_role" "eksworkshop-admin" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows EC2 instances to call AWS services on your behalf."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  max_session_duration = "3600"
  name                 = var.cloud9_role_name
  path                 = "/"
}

resource "aws_iam_role_policy_attachment" "eksworkshop-admin_AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.eksworkshop-admin.id
}

resource "aws_iam_instance_profile" "cloud9-ec2-profile" {
  name = var.cloud9_role_name
  role = aws_iam_role.eksworkshop-admin.name
}
