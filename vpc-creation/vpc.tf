provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

#----------------------------VPC---------------------------------------

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "TF-VPC"
  }
}


# -------------------Internet Gateway-----------------------------

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "TF-IGW"
  }
}


# ----------------------------Public Subnet---------------------------

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "TF-Public-Subnet"
  }
}

# ---------------------------Private Subnet-------------------------------

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "TF-Private-Subnet"
  }
}


# --------------------------Public Route Table-----------------------------

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "TF-Public-RT"
  }
}

# ----------------------Public Route Table Association--------------------

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}


# ------------------------PRIVATE ROUTE TABLE------------------------------------

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "TF-Private-RT"
  }
}

# ----------------------Private Route Table Association--------------------

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private_rt.id
}
 