resource "aws_codedeploy_app" "applications" {
    for_each = var.codedeploy_applications

    compute_platform = "Server"
    name = each.value.application_name
}


resource "aws_codedeploy_deployment_group" "UAT" {
    for_each = var.codedeploy_applications
    app_name              = each.value.application_name

    deployment_group_name = each.value.uat_deployment_group_name
    service_role_arn      = aws_iam_role.codedeploy_role.arn

    ec2_tag_set {
        ec2_tag_filter {
            key   = each.value.uat_ec2_deployment_tags_set.deployment_tag_key
            type  = "KEY_AND_VALUE"
            value = each.value.uat_ec2_deployment_tags_set.deployment_tag_value
        }
    }

    depends_on = [ aws_codedeploy_app.applications ]

}


resource "aws_codedeploy_deployment_group" "LIVE" {
    for_each = var.codedeploy_applications
    app_name              = each.value.application_name

    deployment_group_name = each.value.live_deployment_group_name
    service_role_arn      = aws_iam_role.codedeploy_role.arn

    ec2_tag_set {
        ec2_tag_filter {
            key   = each.value.live_ec2_deployment_tags_set.deployment_tag_key
            type  = "KEY_AND_VALUE"
            value = each.value.live_ec2_deployment_tags_set.deployment_tag_value
        }
    }

    depends_on = [ aws_codedeploy_app.applications ]

}