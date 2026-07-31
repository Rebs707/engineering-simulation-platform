variable "vpc_id" {
  description = "ID of the VPC containing the route tables."
  type        = string
}

variable "internet_gateway_id" {
  description = "Internet Gateway ID used by the public route table."
  type        = string
}

variable "nat_gateway_id" {
  description = "NAT Gateway ID used by the private route table."
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs associated with the public route table."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs associated with the private route table."
  type        = list(string)
}

variable "public_route_table_name" {
  description = "Name assigned to the public route table."
  type        = string
  default     = "public-route-table"
}

variable "private_route_table_name" {
  description = "Name assigned to the private route table."
  type        = string
  default     = "private-route-table"
}

variable "tags" {
  description = "Additional tags applied to both route tables."
  type        = map(string)
  default     = {}
}
