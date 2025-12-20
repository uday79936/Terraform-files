locals {

  # ---------------- Project prefix for naming ----------------
  project_prefix = var.vpc_name

  # ---------------- Resource Names ---------------------------
  vpc_tag_name               = local.project_prefix
  igw_tag_name               = var.igw_name

  public_subnet_tag_name     = var.public_subnet_name
  private_subnet_tag_name    = var.private_subnet_name

  public_rt_tag_name         = var.public_route_table_name
  private_rt_tag_name        = var.private_route_table_name

  # ---------------- Subnet CIDRs -----------------------------
  public_cidr  = var.public_subnet_cidr
  private_cidr = var.private_subnet_cidr

  # ---------------- Availability zone ------------------------
  az = var.az
}
