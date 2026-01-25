output "frontend_public_ips" {
  value = [for instance in aws_instance.lb : instance.public_ip]
}

output "frontend_private_ips" {
  value = [for instance in aws_instance.lb : instance.private_ip]
}
