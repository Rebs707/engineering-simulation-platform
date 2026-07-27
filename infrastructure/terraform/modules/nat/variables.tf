variable "public_subnet_id" {
  description = "Public subnet for NAT Gateway"
  type        = string
}

variable "allocation_id" {
  description = "Elastic IP Allocation ID"
  type        = string
}
