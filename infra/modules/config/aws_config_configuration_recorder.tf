resource "aws_config_configuration_recorder" "main" {
  name     = "main"
  role_arn = var.iam_role_arn_for_config

  recording_group {
    all_supported = true
  }

  depends_on = [aws_config_delivery_channel.config_channel]
}
