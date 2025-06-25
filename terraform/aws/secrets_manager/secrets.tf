resource "aws_db_instance" "mysql_ssm_secret_a" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name              = "mydb"
  username             = "admin"
  password             = aws_secretsmanager_secret_version.secret.secret_string
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}



resource "aws_secretsmanager_secret" "secret" {
  name        = "mysql_terraform_database_admin_secret"
  description = "The secret description"

}

data "aws_secretsmanager_random_password" "secret" {
  password_length = 10
  exclude_punctuation = true
}

resource "aws_secretsmanager_secret_version" "secret" {
  secret_id = aws_secretsmanager_secret.secret
  secret_string = data.aws_secretsmanager_random_password.secret.random_password
}
