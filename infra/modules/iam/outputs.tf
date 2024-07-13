output "iam_role_arn_for_config" {
  value = aws_iam_role.config_role.arn
}

output "iam_role_arn_for_lambda" {
  value = aws_iam_role.lambda_role.arn
}
