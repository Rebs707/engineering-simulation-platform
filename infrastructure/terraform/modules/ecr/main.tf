resource "aws_ecr_repository" "app" {
  name                 = "engineering-simulation-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
