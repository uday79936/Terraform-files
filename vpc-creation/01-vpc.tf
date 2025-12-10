provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

#---------------------------- VPC ---------------------------------------

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "TF-VPC"
  }
}

# ------------------- Internet Gateway -----------------------------

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "TF-IGW"
  }
}

# ---------------------------- Public Subnets ---------------------------

resource "aws_subnet" "public" {
  count                   = 3
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet("10.0.0.0/16", 8, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "TF-Public-Subnet-${count.index + 1}"
  }
}

# --------------------------- Private Subnets -------------------------------

resource "aws_subnet" "private" {
  count      = 3
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet("10.0.0.0/16", 8, count.index + 3)

  tags = {
    Name = "TF-Private-Subnet-${count.index + 1}"
  }
}

# -------------------------- Public Route Tables -----------------------------

resource "aws_route_table" "public_rt" {
  count  = 3
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "TF-Public-RT-${count.index + 1}"
  }
}

# ---------------------- Public Route Table Associations --------------------

resource "aws_route_table_association" "public_assoc" {
  count          = 3
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt[count.index].id
}

# ------------------------ Private Route Tables ------------------------------------

resource "aws_route_table" "private_rt" {
  count  = 3
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "TF-Private-RT-${count.index + 1}"
  }
}

# ---------------------- Private Route Table Associations --------------------

resource "aws_route_table_association" "private_assoc" {
  count          = 3
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt[count.index].id
}
