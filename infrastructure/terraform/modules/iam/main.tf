resource "aws_iam_role" "eks_cluster" {
  name = "engineering-simulation-eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role" "eks_nodes" {
  name = "engineering-simulation-eks-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "aws_load_balancer_controller" {
  name        = "engineering-simulation-aws-load-balancer-controller"
  description = "Permissions required by the AWS Load Balancer Controller"
  policy      = file("${path.module}/aws-load-balancer-controller-policy.json")
}
