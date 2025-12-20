terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = local.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = local.vpc_cidr
  vpc_name = local.vpc_name

  igw_name = local.igw_name

  public_subnet_cidr  = local.public_subnet_cidr
  private_subnet_cidr = local.private_subnet_cidr

  public_subnet_name  = local.public_subnet_name
  private_subnet_name = local.private_subnet_name

  public_route_table_name  = local.public_route_table_name
  private_route_table_name = local.private_route_table_name

  az = local.availability_zone
}
