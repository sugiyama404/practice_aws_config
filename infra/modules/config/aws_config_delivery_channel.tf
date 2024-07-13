resource "aws_config_delivery_channel" "config_channel" {
  name           = "config-delivery-channel"
  s3_bucket_name = var.s3_bucket_id
}
