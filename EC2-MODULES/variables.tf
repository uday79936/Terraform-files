# AWS Credentials
variable "access_key" {
  type    = string
  default = ""
}

variable "secret_key" {
  type    = string
  default = ""
}

# Region
variable "region" {
  type    = string
  default = "us-east-2"
}

# EC2 Settings
variable "ami" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_name" {
  type    = string
  default = "Uday-EC2"
}

variable "public_ip" {
  type    = bool
  default = true
}

# Subnet — YOU MUST PUT YOUR SUBNET ID
variable "subnet_id" {
  type    = string
  default = ""
}
