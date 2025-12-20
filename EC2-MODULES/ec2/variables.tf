variable "subnet_id" {
  type        = string
  description = "Subnet to launch EC2 instance"
  default = "subnet-01a50896605004370"
}

variable "ami" {
  type        = string
  description = "AMI ID to use"
  default = "ami-00e428798e77d38d9"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  type        = string
  default     = "ec2-server"
}

variable "public_ip" {
  type        = bool
  default     = true
}
