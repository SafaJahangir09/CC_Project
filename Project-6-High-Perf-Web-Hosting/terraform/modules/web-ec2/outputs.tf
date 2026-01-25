output "backend_public_ips" {
  value = [for instance in aws_instance.web : instance.public_ip]
}

output "backend_private_ips" {
  value = [for instance in aws_instance.web : instance.private_ip]
}
