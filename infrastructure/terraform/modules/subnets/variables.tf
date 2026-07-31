variable "vpc_id" {
  description = "ID of the VPC that will contain the subnets."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks assigned to public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks assigned to private subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability Zones used for subnet placement."
  type        = list(string)
}

variable "public_subnet_name_prefix" {
  description = "Name prefix applied to public subnets."
  type        = string
  default     = "public"
}

variable "private_subnet_name_prefix" {
  description = "Name prefix applied to private subnets."
  type        = string
  default     = "private"
}

variable "tags" {
  description = "Additional tags applied to all subnets."
  type        = map(string)
  default     = {}
}
