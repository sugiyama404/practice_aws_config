resource "aws_cloudwatch_event_rule" "config_rule_compliance" {
  name        = "config-rule-compliance"
  description = "Event rule for AWS Config compliance"
  event_pattern = jsonencode({
    "source" : [
      "aws.config"
    ],
    "detail-type" : [
      "Config Rules Compliance Change"
    ],
    "detail" : {
      "messageType" : ["ComplianceChangeNotification"],
      "configRuleName" : [
        var.config_rule_s3_bucket_tag_name
      ],
      "newEvaluationResult" : {
        "complianceType" : [
          "NON_COMPLIANT"
        ]
      }
    }
  })

  tags = {
    Name = "sns-event"
  }
}
