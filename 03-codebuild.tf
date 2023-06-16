resource "aws_codebuild_project" "tef_codebuild" {
    name          = var.build_project_name
    description   = "universal build project example"
    service_role  = aws_iam_role.codebuild_role.arn

    artifacts {
      type = "NO_ARTIFACTS"
    }

  #   cache {
  #     type     = "S3"
  #     location = aws_s3_bucket.example.bucket
  #   }

    environment {
      compute_type                = "BUILD_GENERAL1_SMALL"
      image                       = "aws/codebuild/standard:5.0"
      type                        = "LINUX_CONTAINER"
      image_pull_credentials_type = "CODEBUILD"

  #     environment_variable {
  #       name  = "SOME_KEY1"
  #       value = "SOME_VALUE1"
  #     }

  #     environment_variable {
  #       name  = "SOME_KEY2"
  #       value = "SOME_VALUE2"
  #       type  = "PARAMETER_STORE"
  #     }
      }

    logs_config {
      cloudwatch_logs {
        status   = "ENABLED"
        group_name  = var.build_log_group_name
      }

  #     s3_logs {
  #       status   = "ENABLED"
  #       location = "${aws_s3_bucket.example.id}/build-log"
  #     }
    }

    source {
      buildspec       = file("/Users/gsarkodie/Desktop/terraform-codedeploy-pipelines/buildspec.yaml")
      type            = "NO_SOURCE"

      git_submodules_config {
        fetch_submodules = false
      }
  }

    source_version = "master"


    
    # tags = {
    #     Name ="deployment"
    #     DeploymentTag = "tef-deployment"
    #   }

}
