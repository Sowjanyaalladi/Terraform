module "dev" {
    source = "../13.Modules"
    instance_type = "t2.micro"
    name = "dev-instance"
    ami_id = "ami-0152204c1a187337c"
    


}