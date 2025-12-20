locals {

  region = var.region

  ami           = var.ami
  instance_type = var.instance_type
  instance_name = var.instance_name
  public_ip     = var.public_ip

  subnet_id = var.subnet_id
}
