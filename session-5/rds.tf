resource "aws_db_instance" "main" {
  allocated_storage    = 10
  identifier = replace( local.name, "rtype", "rds") #the name od RDS insatnce
  db_name              = "mydb"       #database name
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = random_password.db_password.result 
  parameter_group_name = "default.mysql8.0"
  tags = local.common_tags
  skip_final_snapshot  = var.env != "prod" ? true : false 
  final_snapshot_identifier = var.env != "prod" ? null : "${var.env}-final-snapshot"
  #true #if true i dont need a snapshot,
  # if false you need a snapshot and here you need another 
  #argument that needs to be identified with an argument final_shapshot_identifier
  # true = dev, qa, stage
  #false = prod
}

resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "%"
}

#for the password AWS secrets manager is the best practice 