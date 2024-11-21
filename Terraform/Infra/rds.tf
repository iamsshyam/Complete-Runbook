resource "aws_db_instance" "trade_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "tradedb"
  username             = "admin"
  password             = "SecurePassword123"
  publicly_accessible  = false
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_ids           = module.vpc.private_subnets
}
