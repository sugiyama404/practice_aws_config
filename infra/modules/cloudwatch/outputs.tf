output "cloudwatch_lambda_trigger_arn" {
  value = aws_cloudwatch_log_subscription_filter.lambda_trigger.destination_arn
}
