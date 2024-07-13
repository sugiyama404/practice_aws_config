resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.config_rule_compliance.name
  target_id = "sendToSNS"
  arn       = var.sns_topic_arn

  input_transformer {
    input_paths = {
      "complianceType" = "$.detail.complianceType",
      "configRuleName" = "$.detail.configRuleName",
      "resourceId"     = "$.detail.resourceId",
      "resourceType"   = "$.detail.resourceType"
    }

    input_template = <<TEMPLATE
"Config rule violation detected:\nCompliance Type: <complianceType>\nConfig Rule Name: <configRuleName>\nResource ID: <resourceId>\nResource Type: <resourceType>"
TEMPLATE
  }
}
