resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc"
  }
  }
  resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.name.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}


resource "aws_security_group" "sg" {
  name        = "my-security-group"
  description = "security group with multiple ports"
  vpc_id      = aws_vpc.name.id

  dynamic "ingress" {
    for_each = [22, 80, 443, 3306]

    content {
      description = "Rule for port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "name" {
  ami                    = "ami-0521cb2d60cfbb1a6"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "my-ec2"
  }
}

    

  




