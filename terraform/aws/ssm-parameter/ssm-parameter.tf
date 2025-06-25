resource "aws_db_instance" "mysql_ssm_secret" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "mydb"
  username             = "admin"
  password             = data.aws_ssm_parameter.ssm_manually_created.value
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}

data "aws_ssm_parameter" "ssm_manually_created" {
  name = "/mysql/admin/password"
}



resource "aws_db_instance" "mysql_ssm_secret_a" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "mydb"
  username             = "admin"
  password             = aws_ssm_parameter.ssm_secret.value
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}

resource "aws_ssm_parameter" "ssm_secret" {
  name        = "/mysql/terraform/database/admin/password"
  description = "The parameter description"
  type        = "SecureString"
  value       = var.admin_password
}
