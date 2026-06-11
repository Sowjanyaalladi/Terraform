bucket = "my-s3-sowjanyaaa-11-06"
acl = "private"
control_object_ownership = true
object_ownership = "ObjectWriter"
versioning = {
  enabled = true
}
tags = {
  Environment = "dev"
  Project     = "my-project"
}
#terrafrorm.tfvars file for Day-10-modules-day-2-examples locally, you can use this file to override the default variable values defined in variables.tf. This allows you to customize the configuration without modifying the main.tf or variables.tf files directly.