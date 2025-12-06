provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""

}

resource "aws_instance" "example" {
  ami           = ""
  instance_type = "t3.micro"
  key_name      = "pro"


  tags = {
    Name = "new"
  }
}