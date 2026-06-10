resource "aws_instance" "name" {
    ami           = "ami-00e801948462f718ab"
    instance_type = "t2.micro"
    
    tags = {
        Name = "test"
    }
  

  lifecycle {
    create_before_destroy = true
}
#  lifecycle {
#     ignore_changes = [ tags, ]
# }
# lifecycle {
#   prevent_destroy = true
# }
}
