variable "instance_names" {
  type = set(string)

  default = [
    "ec2-1",
    "ec2-2"
  ]
}