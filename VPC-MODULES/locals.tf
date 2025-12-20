locals {

  # AWS Settings
  region = var.region

  # VPC block
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name

  # Internet Gateway
  igw_name = var.igw_name

  # Subnets
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

  public_subnet_name  = var.public_subnet_name
  private_subnet_name = var.private_subnet_name

  # Route tables
  public_route_table_name  = var.public_route_table_name
  private_route_table_name = var.private_route_table_name

  # Availability zone
  availability_zone = var.availability_zone
}
