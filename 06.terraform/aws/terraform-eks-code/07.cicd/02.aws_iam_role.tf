resource "aws_iam_role" "codebuild-eks-cicd-build-app-service-role" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "codebuild.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "codebuild-eks-cicd-build-app-service-role"
  path                  = "/service-role/"
  tags                  = {}
}

resource "aws_iam_role" "AWSCodePipelineServiceRole-pipe-eksworkshop-app" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "codepipeline.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "AWSCodePipelineServiceRole-pipe-eksworkshop-app"
  path                  = "/service-role/"
  tags                  = {}
}
