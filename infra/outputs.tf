output "instance_public_ip" {
  value = aws_instance.assignment2.public_ip
}

output "lb_endpoint" {
  value = aws_lb.assignment2.dns_name
}

# output "db_endpoint" {
#   value = 
# }

# output "db_user" {
#   value = 
# }

# output "db_pass" {
#   value = 
# }
