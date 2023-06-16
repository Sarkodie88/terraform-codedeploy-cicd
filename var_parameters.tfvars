codedeploy_role_name = "universal-codedeploy-role"
codepipeline_role_name = "universal-codepipeline-role"
codebuild_role_name = "universal-codebuild-role"
build_project_name = "universal-build-project"
build_log_group_name = "universal-build-logs"

codedeploy_applications = {
    "frontend-application" = {
      application_name = "frontend-application"
      compute_platform = "Server"
      uat_deployment_group_name = "UAT"
      live_deployment_group_name = "LIVE"
      deployment_branch = "master"
      uat_ec2_deployment_tags_set = {
        deployment_tag_key = "DeploymentTag"
        deployment_tag_value = "frontend-uat"
      }
      live_ec2_deployment_tags_set = {
        deployment_tag_key = "DeploymentTag"
        deployment_tag_value = "frontend-live"
      }
    }

    "backend-application" = {
      application_name = "backend-application"
      compute_platform = "Server"
      uat_deployment_group_name = "UAT"
      live_deployment_group_name = "LIVE"
      deployment_branch = "master"
      uat_ec2_deployment_tags_set = {
        deployment_tag_key = "DeploymentTag"
        deployment_tag_value = "backend-uat"
      }
      live_ec2_deployment_tags_set = {
        deployment_tag_key = "DeploymentTag"
        deployment_tag_value = "backend-live"
      }
    }
}

