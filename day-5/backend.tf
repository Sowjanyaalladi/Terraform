terraform {
  backend "s3" {
    bucket = "anjaliiiiiiiiiiiiiiiiiiiiii"
    key    = "terraform.tfstate"
   
    encrypt = true
    #use_lockfile = true  #s3 native locking process to prevent concurrent state modifications
    region = "us-east-1"
  }
}