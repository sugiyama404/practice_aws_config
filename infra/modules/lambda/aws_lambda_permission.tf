resource "aws_lambda_permission" "allow_config" {
  statement_id  = "AllowExecutionFromConfig"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.main.function_name
  principal     = "config.amazonaws.com"
}
