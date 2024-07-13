resource "aws_iam_policy_attachment" "config_attach" {
  name       = "${var.app_name}-ecr-attach"
  roles      = ["${aws_iam_role.config_role.name}"]
  policy_arn = aws_iam_policy.config_role_policy.arn
}
