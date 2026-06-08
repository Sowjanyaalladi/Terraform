variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "name" {
  description = "Instance Name"
  type        = string
  default     = "Dev-Server"
}