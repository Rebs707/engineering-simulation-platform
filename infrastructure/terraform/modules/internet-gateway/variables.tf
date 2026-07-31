variable "vpc_id" {
  description = "ID of the VPC to attach the Internet Gateway to."
  type        = string
}

variable "name" {
  description = "Name assigned to the Internet Gateway."
  type        = string
  default     = "engineering-simulation-igw"
}

variable "tags" {
  description = "Additional tags applied to the Internet Gateway."
  type        = map(string)
  default     = {}
}
