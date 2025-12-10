# --------------------- Provider Variables ----------------------

variable "access_key" {
  description = "AWS Access Key"
  type        = string
  default     = ""
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
  default     = ""
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

# --------------------- VPC Variables ---------------------------

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "Uday-vpc"
}

# -------------------- Subnet Variables -------------------------

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
  default     = "Public-subnet"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
  default     = "Private-subnet"
}

# -------------------- Availability Zone ------------------------

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

# -------------------- Internet Gateway -------------------------

variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
  default     = "Uday-igw"
}

# -------------------- Route Table Names ------------------------

variable "public_route_table_name" {
  description = "Name of the public route table"
  type        = string
  default     = "public-rt"
}

variable "private_route_table_name" {
  description = "Name of the private route table"
  type        = string
  default     = "private-rt"
}
