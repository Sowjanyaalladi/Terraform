resource "aws_instance" "name" {
    ami           = "ami-0152204c1a187337c"
    instance_type = "t2.medium"
    tags = {
        Name = "Terraform-0900AM"
    }
}