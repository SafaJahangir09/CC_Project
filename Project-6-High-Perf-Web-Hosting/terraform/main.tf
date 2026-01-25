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
  subnet_ids         = module.network.public_subnet_ids
  security_group_ids = [module.network.backend_sg_id]
  instance_count     = 2
  security_group_id  = module.network.frontend_sg_id
  name               = "backend"
}
