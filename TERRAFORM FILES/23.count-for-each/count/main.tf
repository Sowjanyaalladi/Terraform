resource "aws_instance" "server" {
  ami           = "ami-0152204c1a187337c"
  instance_type = "t2.micro"
  count = 2
  tags = { 
    Name = "ec2-${count.index}"
  }
}
  #here two instances will create and ec2 0 and ec2 