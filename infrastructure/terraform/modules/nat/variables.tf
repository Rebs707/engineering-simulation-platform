variable "public_subnet_id" {
  description = "ID of the public subnet where the NAT Gateway is created."
  type        = string
}

variable "allocation_id" {
  description = "Allocation ID of the Elastic IP assigned to the NAT Gateway."
  type        = string
}

variable "name" {
  description = "Name assigned to the NAT Gateway."
  type        = string
  default     = "nat-gateway"
}

variable "tags" {
  description = "Additional tags applied to the NAT Gateway."
  type        = map(string)
  default     = {}
}
