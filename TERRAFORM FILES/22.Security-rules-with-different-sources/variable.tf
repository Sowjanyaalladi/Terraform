variable "dev" {
  type = map(string)

  default = {
    "22"  = "10.0.0.0/8"
    "80"  = "10.0.0.0/16"
    "443" = "10.0.0.0/16"
  }
}


