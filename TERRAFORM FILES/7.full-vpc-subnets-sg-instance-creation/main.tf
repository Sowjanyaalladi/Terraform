#Creation of VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Dev-vpc"
    }
}
#creation of public subnets
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
    tags = {
        Name = "Dev-subnet"
    }
}
#creation of private subnets
resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
        tags = {
            Name = "Dev-subnet2"
        }
}
#creation of internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
    tags = {
        Name = "Dev-igw"
    }
}
#creation of route table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
    tags = {
        Name = "Dev-rt"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }
}
#association of route table with public subnet
resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

#creation of security group
resource "aws_security_group" "main" {
  name        = "dev-sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#creation of EC2 instance in public subnet
resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.main.id]
    tags = {
        Name = var.name
    }
}