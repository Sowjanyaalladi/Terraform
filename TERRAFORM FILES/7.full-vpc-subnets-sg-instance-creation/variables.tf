variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default = ""
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string

}

variable "name" {
  description = "The name for the EC2 instance"
  type        = string
    default = ""
}