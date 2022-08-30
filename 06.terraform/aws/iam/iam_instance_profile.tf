resource "aws_iam_instance_profile" "eksworkshop-admin" {
  name = aws_iam_role.eksworkshop-admin.name
  path = "/"
  role = aws_iam_role.eksworkshop-admin.name
}
