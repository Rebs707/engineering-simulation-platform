variable "log_group_name" {
  description = "CloudWatch Log Group name."
  type        = string
}

variable "retention_in_days" {
  description = "CloudWatch log retention period."
  type        = number
  default     = 30
}

variable "alarm_name" {
  description = "CloudWatch alarm name."
  type        = string
}

variable "metric_name" {
  description = "Metric monitored by the alarm."
  type        = string
  default     = "CPUUtilization"
}

variable "namespace" {
  description = "CloudWatch metric namespace."
  type        = string
  default     = "AWS/EC2"
}

variable "threshold" {
  description = "Alarm threshold."
  type        = number
  default     = 80
}

variable "tags" {
  description = "Additional tags."
  type        = map(string)
  default     = {}
}

variable "dimensions" {
  description = "Dimensions identifying the resource monitored by the alarm."
  type        = map(string)
  default     = {}
}

variable "comparison_operator" {
  description = "Operator used to compare the metric against the threshold."
  type        = string
  default     = "GreaterThanThreshold"
}

variable "evaluation_periods" {
  description = "Number of periods evaluated before the alarm changes state."
  type        = number
  default     = 2
}

variable "period" {
  description = "Metric evaluation period in seconds."
  type        = number
  default     = 300
}
