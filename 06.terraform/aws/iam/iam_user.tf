resource "aws_iam_user" "user" {
  force_destroy = "false"
  name          = var.user_name
  path          = "/"
}

resource "aws_iam_user_group_membership" "viewusertoviewgroup" {
  groups = [
    aws_iam_group.developers.name
  ]
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
  user       = aws_iam_user.user.name
}

resource "aws_iam_user_login_profile" "login_profile" {
  user = aws_iam_user.user.name
}

resource "aws_iam_access_key" "access_key" {
  user = aws_iam_user.user.name
}

output "Username" {
  value = aws_iam_user.user.name
}

output "Password" {
  value = aws_iam_user_login_profile.login_profile.password
}

output "AccessKeyID" {
  value = aws_iam_access_key.access_key.id
}

// terraform output -raw SecretAccessKey
output "SecretAccessKey" {
  value     = aws_iam_access_key.access_key.secret
  sensitive = true
}
