resource "aws_sns_topic" "sns_topic" {
  name = "email_topic"

  tags = {
    "Name" = "${var.app_name}-email_topic"
  }
}
