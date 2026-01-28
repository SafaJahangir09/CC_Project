module "network" {
  source = "./modules/network"

  vpc_cidr       = "10.0.0.0/16"

  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnets = [
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24"
  ]

  azs = [
    "me-central-1a",
    "me-central-1b",
    "me-central-1c"
  ]

  environment = "dev"
  project     = "high-perf-web"
}


module "frontend_ec2" {
  source = "./modules/ec2"

  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_ids         = module.network.public_subnet_ids
  security_group_ids = [module.network.frontend_sg_id]
  instance_count     = 2
  security_group_id  = module.network.frontend_sg_id
  name               = "frontend"
}
module "backend_ec2" {
  source = "./modules/ec2"
  
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_ids         = [module.network.public_subnet_ids[0]]
  security_group_ids = [module.network.backend_sg_id]
  instance_count     = 2
  security_group_id  = module.network.backend_sg_id
  name               = "backend"
}

resource "aws_key_pair" "nayab_key" {
  key_name   = "nayab-key"
  public_key ="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDOWqN+y51zNmxq6ttSo5sLFd8unyWp58kPuTBQH/SLFCRa/6K9hp5FZSQDxAy/Rku1bQt8JykYqRZ/uuCGiuavlm/IoyPrT2uh1/v/rPnxlY5sy8T/MPmG7eR9o/63tl3R5Wz5sV5WJ5kznpgEUTIaGIV2QRnX559gqfpFzON/9hJsmpZo0nnibE8HNg1RhIQ+Ftc1jQSpe4Z2l7uD7P53Wq6YlwlbGhrz0NvNmTOSpmfF/yRpRZdTouBSmk8YU9jQyN/B4T9gvb9lJmI/93ZCugvL7CrcI0EhlRzKoUuZBDQiQeJZQoyu/7kRaKc1akGs4QoKk4rHpf8s/FxwW8e+Y/3UWu4mwQwzrx+bhxKQRDfXbm/+gr6vIlXSHPL+B1arD6sqIrxHGNAH/ZJ6D873c+vacTmf7HWqn+4dPaf5uhThVUhXf1E/S6Sd9acw3MI7Gx0d+9jXm1oR3LOu0hNyWBBu5m27m6sClBCMQh1DAnv3v8+BZrqL2EuGLQ98Bv5WWz0V/7U8rvK6NdDhwlinzv7KuTenRGAswy8puvvvmO3LCITuzE+YzKRR9el/Hkj+u1HexwUxcxFQL+w5DVOuyie4sUR2oOxcUWkktWbht8NR8c7KREPrAlQsLEFDjmboWUm9LYI1p7J1zmDOB1VvPx4KdEEbQtDgOHy6rYIefQ== codespace@codespaces-2f844e"
}
