variable "cluster_role_name" {
  description = "Name of the IAM role used by the EKS control plane."
  type        = string
  default     = "engineering-simulation-eks-cluster-role"
}

variable "node_role_name" {
  description = "Name of the IAM role used by EKS worker nodes."
  type        = string
  default     = "engineering-simulation-eks-node-role"
}

variable "load_balancer_policy_name" {
  description = "Name of the AWS Load Balancer Controller IAM policy."
  type        = string
  default     = "engineering-simulation-aws-load-balancer-controller"
}
