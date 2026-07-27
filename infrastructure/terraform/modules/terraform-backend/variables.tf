variable "bucket_name" {
  description = "Globally unique S3 bucket name for Terraform state."
  type        = string
}

variable "lock_table_name" {
  description = "DynamoDB table name for Terraform state locking."
  type        = string
}

variable "environment" {
  description = "Environment associated with the backend resources."
  type        = string
  default     = "shared"
}

variable "tags" {
  description = "Additional tags for backend resources."
  type        = map(string)
  default     = {}
}
