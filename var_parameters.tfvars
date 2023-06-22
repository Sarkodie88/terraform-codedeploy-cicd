codedeploy_role_name   = "universal-codedeploy-role"
codepipeline_role_name = "universal-codepipeline-role"
codebuild_role_name    = "universal-codebuild-role"
build_project_name     = "universal-build-project"
build_log_group_name   = "universal-build-logs"
s3_artifact_store = "s3-bucket-name"

codedeploy_applications = {
  "my-instance-1" = {
    ami                        = "frontend-application"
    compute_platform           = "Server"
    uat_deployment_group_name  = "Staging"
    live_deployment_group_name = "Production"
    deployment_branch          = "master"
    uat_ec2_deployment_tags_set = {
      deployment_tag_key   = "DeploymentTag"
      deployment_tag_value = "frontend-staging"
    }
    live_ec2_deployment_tags_set = {
      deployment_tag_key   = "DeploymentTag"
      deployment_tag_value = "frontend-prod"
    }
  }

  "backend-application" = {
    application_name           = "backend-application"
    compute_platform           = "Server"
    uat_deployment_group_name  = "Staging"
    live_deployment_group_name = "Production"
    deployment_branch          = "master"
    uat_ec2_deployment_tags_set = {
      deployment_tag_key   = "DeploymentTag"
      deployment_tag_value = "backend-staging"
    }
    live_ec2_deployment_tags_set = {
      deployment_tag_key   = "DeploymentTag"
      deployment_tag_value = "backend-prod"
    }
  }
}

