module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "newsread-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway     = false
  enable_vpn_gateway     = false
  enable_dns_hostnames   = true
  enable_dns_support     = true
  instance_tenancy       = "default"

  tags = {
    Terraform   = "true"
    Environment = "prod"
  }
}