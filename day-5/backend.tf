terraform {
  backend "s3" {
    bucket         = "sowjiiiiiiiiiiiiiiiiiiiiiiii"
    key            = "terraform.tfstate"
    dynamodb_table = "sowji"


    encrypt = true
    #use_lockfile = true  #s3 native locking process to prevent concurrent state modifications
    region = "us-east-1"
  }
}