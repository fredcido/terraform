terraform {
  backend "s3" {
    bucket = "terraform-state-43e0e4c8"
    key = "terraform/ecs"
    region = "eu-west-1"
  }
}