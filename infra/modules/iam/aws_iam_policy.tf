resource "aws_iam_policy" "config_role_policy" {

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
          "ec2:Describe*",
          "config:Put*",
          "config:Describe*",
          "config:Get*",
          "config:List*",
          "config:Deliver*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name = "lambda_policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetBucketTagging",
          "config:PutEvaluations"
        ],
        Resource = "*",
        Effect   = "Allow"
      }
    ]
  })
}
