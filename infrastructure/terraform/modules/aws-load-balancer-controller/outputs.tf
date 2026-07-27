output "iam_role_arn" {
  description = "ARN of the controller IAM role."
  value       = aws_iam_role.controller.arn
}

output "iam_role_name" {
  description = "Name of the controller IAM role."
  value       = aws_iam_role.controller.name
}
