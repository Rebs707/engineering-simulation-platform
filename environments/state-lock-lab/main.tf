terraform {
  required_version = ">= 1.5.0"
}

resource "terraform_data" "example" {
  input = "state-lock-lab-updated"
}

resource   "terraform_data"   "format_failure"{
input="ci-format-test"
}

resource   "terraform_data"   "format_failure"{
input="ci-format-test"
}
