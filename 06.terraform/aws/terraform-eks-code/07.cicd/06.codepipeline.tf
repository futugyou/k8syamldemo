resource "aws_codepipeline" "pipe-eksworkshop-app" {
  name       = var.cluster-name
  depends_on = [aws_iam_role.AWSCodePipelineServiceRole-pipe-eksworkshop-app]
  role_arn   = aws_iam_role.AWSCodePipelineServiceRole-pipe-eksworkshop-app.arn
  tags       = {}

  artifact_store {
    location = data.aws_s3_bucket.codepipeline.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      category = "Source"
      configuration = {
        "BranchName"           = "master"
        "OutputArtifactFormat" = "CODE_ZIP"
        "PollForSourceChanges" = "true"
        "RepositoryName"       = var.cluster-name
      }
      input_artifacts = []
      name            = "Source"
      namespace       = "SourceVariables"
      output_artifacts = [
        "SourceArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeCommit"
      region    = var.default_region
      run_order = 1
      version   = "1"
    }
  }
  stage {
    name = "Build"

    action {
      category = "Build"
      configuration = {
        "ProjectName" = var.cluster-name
      }
      input_artifacts = [
        "SourceArtifact",
      ]
      name      = "Build"
      namespace = "BuildVariables"
      output_artifacts = [
        "BuildArtifact",
      ]
      owner     = "AWS"
      provider  = "CodeBuild"
      region    = var.default_region
      run_order = 1
      version   = "1"
    }
  }
}
