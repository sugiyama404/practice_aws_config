resource "aws_cloudwatch_log_subscription_filter" "lambda_trigger" {
  name            = "ErrorLogsToLambda"
  log_group_name  = var.webserver_log_group_name
  filter_pattern  = "error"
  destination_arn = var.lambda_function_arn
}
