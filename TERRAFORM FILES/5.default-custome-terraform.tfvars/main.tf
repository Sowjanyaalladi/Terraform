resource "aws_instance" "name" {
    ami           = var.ami_id
    instance_type = var.instance_type
    tags = {
        Name = var.name
    }
  
}

#terraform apply -auto-approve -var="instance_type=t2.micro"
#note we can pass the vaule at the time of run terraform apply.