resource "aws_iam_policy" "config_role_policy" {

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
          "sns:*",
          "config:*",
          "cloudwatch:*",
          "events:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}
