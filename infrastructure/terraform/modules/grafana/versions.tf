terraform {
  required_version = ">= 1.6.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}
