output "cluster_role_arn" {
  description = "ARN of the EKS cluster IAM role."
  value       = aws_iam_role.eks_cluster.arn
}

output "cluster_role_name" {
  description = "Name of the EKS cluster IAM role."
  value       = aws_iam_role.eks_cluster.name
}

output "node_role_arn" {
  description = "ARN of the EKS node-group IAM role."
  value       = aws_iam_role.eks_nodes.arn
}

output "node_role_name" {
  description = "Name of the EKS node-group IAM role."
  value       = aws_iam_role.eks_nodes.name
}

output "aws_load_balancer_controller_policy_arn" {
  description = "ARN of the AWS Load Balancer Controller IAM policy."
  value       = aws_iam_policy.aws_load_balancer_controller.arn
}
