output "cluster_name" {
  value = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "cluster_certificate_authority" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_oidc_provider_arn" {

  description = "ARN of the EKS IAM OIDC provider."

  value       = aws_iam_openid_connect_provider.eks.arn

}



output "cluster_oidc_issuer_url" {

  description = "OIDC issuer URL of the EKS cluster."

  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer

}
