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

module "ec2" {
  source = "./modules/ec2"

  subnet_id     = local.subnet_id
  ami           = local.ami
  instance_type = local.instance_type
  instance_name = local.instance_name
  public_ip     = local.public_ip
}
