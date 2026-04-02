resource "aws_instance" "this" {
  ami                         = local.ami
  instance_type               = local.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.public_ip

  tags = {
    Name = local.instance_name
  }
}
