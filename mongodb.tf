resource "aws_db_instance" "mongodb_instance" {
  identifier           = "my-mongodb-instance"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mongodb"
  engine_version       = "4.0"
  instance_class       = "db.t2.medium"  # Configura según tus necesidades
  name                 = "mydatabase"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mongodb4.0"
}
