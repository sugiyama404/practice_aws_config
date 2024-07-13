resource "aws_config_config_rule" "s3_bucket_tag" {
  name = "s3-bucket-name-tag-rule"

  source {
    owner             = "AWS"
    source_identifier = "REQUIRED_TAGS"
  }

  scope {
    compliance_resource_types = [
      "AWS::S3::Bucket"
    ]
  }

  input_parameters = jsonencode({
    tag1Key = "Name",
  })
}
