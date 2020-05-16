resource "aws_db_instance" "assignment2" {
  instance_class         = "db.t2.micro"
  engine                 = "postgres"
  engine_version         = "9.6.16"
  storage_type           = "gp2"
  allocated_storage      = 20
  name                   = "assignment2"
  username               = "postgres"
  password               = "postgres123"
  apply_immediately      = "true"
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.assignment2db.id]
  skip_final_snapshot    = true
}

resource "aws_db_subnet_group" "default" {
  name       = "assignment2dbsubnet"
  subnet_ids = [aws_subnet.data_az1.id, aws_subnet.data_az2.id, aws_subnet.data_az3.id]
}

resource "aws_security_group" "assignment2db" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
