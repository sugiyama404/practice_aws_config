resource "aws_config_configuration_recorder" "main" {
  name     = "main"
  role_arn = var.iam_role_arn_for_config

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}
