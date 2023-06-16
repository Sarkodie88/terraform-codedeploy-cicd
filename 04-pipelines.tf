resource "aws_codepipeline" "pipelines" {
    for_each = var.codedeploy_applications

    name = each.value.application_name

    role_arn = aws_iam_role.codepipeline_role.arn
    artifact_store {
        location ="nat-test-tf-bucket"
        type     = "S3"

    }

    stage {
        name = "Source"

        action {
        run_order        = 1
        name             = "Source"
        category         = "Source"
        owner            = "AWS"
        provider         = "CodeCommit"
        version          = "1"
        output_artifacts = ["source_output"]

        configuration = {
            RepositoryName       = each.value.application_name
            BranchName           = each.value.deployment_branch
            PollForSourceChanges = false
            }
        }
    }

    stage {
        name = "Build"

        action {
        run_order        = 1
        name             = "Build"
        category         = "Build"
        owner            = "AWS"
        provider         = "CodeBuild"
        input_artifacts  = ["source_output"]
        output_artifacts = ["build_output"]
        version          = "1"

        configuration = {
            ProjectName = var.build_project_name
        }
        }
    }

    stage {
        name = "Deploy"

        action {
        run_order       = 1
        name            = "Deploy"
        category        = "Deploy"
        owner           = "AWS"
        provider        = "CodeDeploy"
        input_artifacts = ["build_output"]
        version         = "1"

        configuration = {
            ApplicationName = each.value.application_name
            DeploymentGroupName   = each.value.uat_deployment_group_name
        }
        }
    }


      stage {
        name = "Manual-Approval"

        action {
          run_order        = 1
          name             = "AWS-Admin-Approval"
          category         = "Approval"
          owner            = "AWS"
          provider         = "Manual"
          version          = "1"
          input_artifacts  = []
          output_artifacts = []

          configuration = {
            CustomData = "Please verify the terraform plan output on the Plan stage and only approve this step if you see expected changes!"
          }
        }
      }

        stage {
        name = "LIVE"

        action {
        run_order       = 1
        name            = "Deploy"
        category        = "Deploy"
        owner           = "AWS"
        provider        = "CodeDeploy"
        input_artifacts = ["build_output"]
        version         = "1"

        configuration = {
            ApplicationName = each.value.application_name
            DeploymentGroupName   = each.value.live_deployment_group_name
        }
        }
    }

    #   stage {
    #     name = "Build With ENV"

    #     action {
    #       run_order        = 1
    #       name             = "Terraform-Apply"
    #       category         = "Build"
    #       owner            = "AWS"
    #       provider         = "CodeBuild"
    #       input_artifacts  = ["CodeWorkspace", "TerraformPlanFile"]
    #       output_artifacts = []
    #       version          = "1"

    #       configuration = {
    #         ProjectName          = aws_codebuild_project.terraform_apply.name
    #         PrimarySource        = "CodeWorkspace"
    #         EnvironmentVariables = jsonencode([
    #           {
    #             name  = "PIPELINE_EXECUTION_ID"
    #             value = "#{codepipeline.PipelineExecutionId}"
    #             type  = "PLAINTEXT"
    #           }
    #         ])
    #       }
    #     }
    #   }

}
