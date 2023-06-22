variable "codedeploy_role_name" {
  type     = string
  nullable = false
}


variable "codepipeline_role_name" {
  type     = string
  nullable = false
}


variable "codebuild_role_name" {
  type     = string
  nullable = false
}


variable "build_project_name" {
  type     = string
  nullable = false
}


variable "build_log_group_name" {
  type     = string
  nullable = false
}


variable "s3_artifact_store" {
  type     = string
  nullable = false
}

variable "codedeploy_applications" {
  type = map(object({
    application_name           = string
    compute_platform           = string
    uat_deployment_group_name  = string
    live_deployment_group_name = string
    deployment_branch          = string
    uat_ec2_deployment_tags_set = object({
      deployment_tag_key   = string
      deployment_tag_value = string
    })
    live_ec2_deployment_tags_set = object({
      deployment_tag_key   = string
      deployment_tag_value = string
    })
  }))

}