variable "vpc_name" {
  description = "Name assigned to the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "IPv4 CIDR block assigned to the VPC."
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS resolution within the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for resources in the VPC."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags applied to the VPC."
  type        = map(string)
  default     = {}
}
