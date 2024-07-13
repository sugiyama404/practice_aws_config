resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.config_rule_compliance.name
  target_id = "sendToSNS"
  arn       = var.sns_topic_arn
}
