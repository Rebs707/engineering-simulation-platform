variable "vpc_id" {
  description = "ID of the VPC containing the security groups."
  type        = string
}

variable "bastion_allowed_cidrs" {
  description = "CIDR blocks permitted to access the bastion host over SSH."
  type        = list(string)
  default     = []
}

variable "alb_allowed_cidrs" {
  description = "CIDR blocks permitted to access the Application Load Balancer."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Additional tags applied to all security groups."
  type        = map(string)
  default     = {}
}
