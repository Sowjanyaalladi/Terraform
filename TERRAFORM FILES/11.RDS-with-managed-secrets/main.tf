

provider "aws" {
  region = "us-east-1"
}

# Generate RDS-safe password
resource "random_password" "rds_password" {
  length  = 16
  special = false
}

# Create Secret
resource "aws_secretsmanager_secret" "rds_secret" {
  name = "rds-secret-new"
}

# Store Username & Password
resource "aws_secretsmanager_secret_version" "rds_secret_value" {
  secret_id = aws_secretsmanager_secret.rds_secret.id

  secret_string = jsonencode({
    username = "admin"
    password = random_password.rds_password.result
  })
}

# Read Secret
data "aws_secretsmanager_secret_version" "rds_secret_data" {
  secret_id = aws_secretsmanager_secret.rds_secret.id

  depends_on = [
    aws_secretsmanager_secret_version.rds_secret_value
  ]
}

# Security Group
resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow MySQL access"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Learning only
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# RDS Instance
resource "aws_db_instance" "mysql" {
  identifier             = "my-rds-instance"
  allocated_storage      = 20
  storage_type           = "gp3"

  engine                 = "mysql"
  engine_version         = "8.0"

  instance_class         = "db.t3.micro"

  username = jsondecode(
    data.aws_secretsmanager_secret_version.rds_secret_data.secret_string
  )["username"]

  password = jsondecode(
    data.aws_secretsmanager_secret_version.rds_secret_data.secret_string
  )["password"]

  publicly_accessible    = true
  skip_final_snapshot    = true
  deletion_protection    = false

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  tags = {
    Name = "terraform-rds"
  }
}

output "secret_name" {
  value = aws_secretsmanager_secret.rds_secret.name
}

output "rds_endpoint" {
  value = aws_db_instance.mysql.endpoint
}