variable "ami_id" {
    type = string
    description = "The AMI ID to use for the EC2 instance" #optional description for the variable
    default = ""
  
}

variable "instance_type" {
    type = string
    description = "The type of instance to use for the EC2 instance" #optional description for the variable
    default = ""
  
}

variable "name" {
    type = string
    description = "The name of the EC2 instance" #optional description for the variable
    default = ""
  
}