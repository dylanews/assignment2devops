output "instance_public_ip" {
  value = aws_instance.assignment2.public_ip
}

output "lb_endpoint" {
  value = aws_lb.assignment2.dns_name
}

output "db_endpoint" {
  value = aws_db_instance.assignment2.endpoint
}

output "db_user" {
  value = aws_db_instance.assignment2.username
}

output "db_pass" {
  value = aws_db_instance.assignment2.password
}

output "db_name" {
  value = aws_db_instance.assignment2.name
}

output "db_port" {
  value = aws_db_instance.assignment2.port
}

output "db_address" {
  value = aws_db_instance.assignment2.address
}
