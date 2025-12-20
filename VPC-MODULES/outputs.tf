output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "Created VPC ID"
}

output "igw_id" {
  value       = module.vpc.internet_gateway_id
  description = "Internet Gateway ID"
}

output "public_subnet_id" {
  value       = module.vpc.public_subnet_id
  description = "Public Subnet ID"
}

output "private_subnet_id" {
  value       = module.vpc.private_subnet_id
  description = "Private Subnet ID"
}

output "public_route_table_id" {
  value       = module.vpc.public_route_table_id
  description = "Public Route Table ID"
}

output "private_route_table_id" {
  value       = module.vpc.private_route_table_id
  description = "Private Route Table ID"
}
