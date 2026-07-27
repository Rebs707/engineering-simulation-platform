variable "namespace" {
  type    = string
  default = "monitoring"
}

variable "release_name" {
  type    = string
  default = "prometheus"
}

variable "chart_version" {
  type    = string
  default = "27.19.0"
}
