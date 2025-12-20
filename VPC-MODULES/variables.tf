# AWS credentials
variable "access_key" {
  type    = string
  default = ""
}

variable "secret_key" {
  type    = string
  default = ""
}

# AWS region
variable "region" {
  type    = string
  default = "us-east-2"
}

# VPC configuration
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "Uday-vpc"
}

# Subnet CIDRs
variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

# Subnet Names
variable "public_subnet_name" {
  type    = string
  default = "Public-subnet"
}

variable "private_subnet_name" {
  type    = string
  default = "Private-subnet"
}

# Route Table names
variable "public_route_table_name" {
  type    = string
  default = "public-rt"
}

variable "private_route_table_name" {
  type    = string
  default = "private-rt"
}

# Availability Zone
variable "availability_zone" {
  type    = string
  default = "us-east-2a"
}

# IGW Name
variable "igw_name" {
  type    = string
  default = "Uday-igw"
}
