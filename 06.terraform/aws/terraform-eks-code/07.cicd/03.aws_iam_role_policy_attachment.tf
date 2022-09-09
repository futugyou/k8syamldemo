resource "aws_iam_role_policy_attachment" "AWSCodePipelineServiceRole-pipe-eksworkshop-app" {
  policy_arn = aws_iam_policy.AWSCodePipelineServiceRole-pipe-eksworkshop-app.arn
  role       = aws_iam_role.AWSCodePipelineServiceRole-pipe-eksworkshop-app.id
}

resource "aws_iam_role_policy_attachment" "cicd-AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.codebuild-eks-cicd-build-app-service-role.id
}

resource "aws_iam_role_policy_attachment" "cicd-CodeBuildBasePolicy-eks-cicd-build-app" {
  policy_arn = aws_iam_policy.CodeBuildBasePolicy-eks-cicd-build-app.arn
  role       = aws_iam_role.codebuild-eks-cicd-build-app-service-role.id
}

resource "aws_iam_role_policy_attachment" "cicd-CodeBuildVpcPolicy-eks-cicd-build-app" {
  policy_arn = aws_iam_policy.CodeBuildVpcPolicy-eks-cicd-build-app.arn
  role       = aws_iam_role.codebuild-eks-cicd-build-app-service-role.id
}
