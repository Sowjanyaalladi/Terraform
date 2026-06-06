resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "Terraform-1100AM"
    }
  
}
resource "aws_subnet" "name" {
    vpc_id     = aws_vpc.name.id
<<<<<<< HEAD
    cidr_block = "10.0.0.0/26"
    tags = {
        Name = "Terraform-0900AM"
    }
}
=======
    cidr_block = "10.0.0.64/26"
    tags = {
        Name = "Terraform-0900AM"
    }
}
>>>>>>> 779bc20 (day5)
