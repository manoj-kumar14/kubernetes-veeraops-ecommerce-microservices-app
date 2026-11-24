resource "aws_db_instance" "rds" {
  allocated_storage       = 20
  storage_type            = "gp2"
  identifier              = "microservices-rds"
  db_subnet_group_name    = aws_db_subnet_group.sub-grp.name
  engine                  = "mysql"
  engine_version          = "8.4"          # Updated to 8.4 to avoid invalid version errors
  instance_class          = "db.t4g.micro" # Free-tier eligible
  multi_az                = false          # Must be false for Free Tier
  db_name                 = "mydb"
  username                = "admin"
  password                = "Cloud123"
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.allow_all.id]
  publicly_accessible     = false          # Must be false for private subnets
  
  backup_retention_period = 0 

  tags = {
    DB_identifier = "book-rds"
  }
}

resource "aws_db_subnet_group" "sub-grp" {
  name       = "main"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]

  tags = {
    Name = "My DB subnet group"
  }
}
