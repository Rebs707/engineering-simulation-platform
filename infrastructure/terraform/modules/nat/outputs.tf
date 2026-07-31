output "nat_gateway_id" {
  description = "ID of the NAT Gateway."
  value       = aws_nat_gateway.this.id
}

output "nat_gateway_public_ip" {
  description = "Public IP address assigned to the NAT Gateway."
  value       = aws_nat_gateway.this.public_ip
}

output "nat_gateway_private_ip" {
  description = "Private IP address assigned to the NAT Gateway."
  value       = aws_nat_gateway.this.private_ip
}
