resource "aws_instance" "server" {
  ami           = "ami-0152204c1a187337c"
  instance_type = "t2.micro"

  for_each = toset(["ec2-1", "ec2-2"])

  tags = {
    Name = each.key
  }
}