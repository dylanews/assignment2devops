resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.public_key
}

resource "aws_instance" "assignment2" {
  ami             = var.ami_id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow_http_ssh.id]
  key_name        = aws_key_pair.deployer.key_name
  subnet_id       = aws_subnet.private_az1.id
}

resource "aws_lb_target_group" "assignment2" {
  name     = "assignment2-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb" "assignment2" {
  name               = "assignment2-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http_ssh.id]
  subnets            = [aws_subnet.public_az1.id, aws_subnet.public_az2.id, aws_subnet.public_az3.id]

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.assignment2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.assignment2.arn
  }
}

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
