resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "different-sources-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_security_group" "sg" {
  name        = "my-security-group"
  description = "Security Group with different sources"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.dev

    content {
      from_port   = tonumber(ingress.key)
      to_port     = tonumber(ingress.key)
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "different-sources-security-group"
  }
}

resource "aws_instance" "server" {
  ami           = "ami-0152204c1a187337c"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.public.id

  vpc_security_group_ids = [
    aws_security_group.sg.id
  ]

  tags = {
    Name = "my-server-with-different-sources"
  }
}