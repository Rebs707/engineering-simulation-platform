output "eks_control_plane_sg_id" {
  description = "ID of the EKS control-plane security group."
  value       = aws_security_group.eks_control_plane.id
}

output "eks_nodes_sg_id" {
  description = "ID of the EKS worker-node security group."
  value       = aws_security_group.eks_nodes.id
}

output "alb_sg_id" {
  description = "ID of the Application Load Balancer security group."
  value       = aws_security_group.alb.id
}

output "bastion_sg_id" {
  description = "ID of the bastion-host security group."
  value       = aws_security_group.bastion.id
}

output "rds_sg_id" {
  description = "ID of the database security group."
  value       = aws_security_group.rds.id
}
