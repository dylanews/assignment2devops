# output "instance_public_ip" {
#   value = 
# }

# output "lb_endpoint" {
#   value = 
# }

# output "db_endpoint" {
#   value = 
# }

# output "db_user" {
#   value = 
# }

# output "db_pass" {
#   value = 
# }

output "endpoint" {
  value = aws_lb.assignment2.dns_name
}
