terraform {
  backend "s3" {
    bucket = "sowjiiiiiiiii"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}