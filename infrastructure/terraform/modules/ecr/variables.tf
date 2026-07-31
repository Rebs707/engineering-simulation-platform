variable "repository_name" {
  description = "Name of the Amazon ECR repository."
  type        = string
  default     = "engineering-simulation-app"
}

variable "image_tag_mutability" {
  description = "Whether image tags are mutable or immutable."
  type        = string
  default     = "MUTABLE"

  validation {
    condition     = contains(["MUTABLE", "IMMUTABLE"], var.image_tag_mutability)
    error_message = "image_tag_mutability must be MUTABLE or IMMUTABLE."
  }
}

variable "scan_on_push" {
  description = "Enable image vulnerability scanning when images are pushed."
  type        = bool
  default     = true
}
