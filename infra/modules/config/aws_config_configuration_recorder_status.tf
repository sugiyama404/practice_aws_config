resource "aws_config_configuration_recorder_status" "main" {
  name       = aws_config_configuration_recorder.main.name
  is_enabled = true
  # Configuration Recorder と Delivery Channel への依存関係を設定
  depends_on = [
    aws_config_configuration_recorder.main,
    aws_config_delivery_channel.config_channel
  ]
}
