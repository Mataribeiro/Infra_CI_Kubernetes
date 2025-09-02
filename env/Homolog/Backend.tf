terraform {
  backend "s3" {
    bucket = "terraform-state-mata"
    key    = "Prod/terraform.tfstate"
    region = "us-east-2"
  }
}
