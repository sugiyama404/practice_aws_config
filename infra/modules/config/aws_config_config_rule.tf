resource "aws_config_config_rule" "s3_bucket_tag" {
  name = "s3-bucket-name-tag-rule"

  source {
    owner             = "CUSTOM_LAMBDA"
    source_identifier = var.lambda_function_arn
    source_detail {
      event_source = "aws.config"
      message_type = "ConfigurationItemChangeNotification"
    }
  }

  scope {
    compliance_resource_types = ["AWS::S3::Bucket"]
  }

  input_parameters = jsonencode({
    tag1Key   = "Name",
    tag1Value = ""
  })

  maximum_execution_frequency = "TwentyFour_Hours"
}
