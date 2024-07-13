resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.config_rule_compliance.name
  target_id = "sendToSNS"
  arn       = var.sns_topic_arn

  input_transformer {
    input_paths = {
      "detail-type"    = "$.detail-type",
      "source"         = "$.source",
      "time"           = "$.time",
      "region"         = "$.region",
      "configRuleName" = "$.detail.configRuleName",
      "messageType"    = "$.detail.messageType",
    }

    input_template = <<TEMPLATE
{
  "message": "Config rule violation detected:",
  "Detail-type Type": "<detail-type>",
  "Source": "<source>",
  "Time": "<time>",
  "Region": "<region>",
  "Config Rule Name": "<configRuleName>",
  "Message Type": "<messageType>"
}
TEMPLATE

  }
}
