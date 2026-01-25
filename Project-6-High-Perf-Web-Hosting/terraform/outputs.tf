output "frontend_public_ips" {
  value = module.frontend_ec2.public_ips
}

output "backend_private_ips" {
  value = module.backend_ec2.private_ips
}

output "backend_public_ips" {
  value = module.backend_ec2.public_ips
}
