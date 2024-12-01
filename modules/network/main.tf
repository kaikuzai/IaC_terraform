resource "aws_vpc" "main_vpc" {
  cidr_block = var.cidr_block_vpc
}

resource "aws_subnet" "subnet_A1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.cidr_block_subnet_A1
  availability_zone = "eu-central-1a"

  tags = {
    Name = "Public Subnet A1"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "subnet_A2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.cidr_block_subnet_A2
  availability_zone = "eu-central-1b"

  tags = {
    Name = "Public Subnet A2"
  }
}

resource "aws_subnet" "subnet_B" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.cidr_block_subnet_B

  tags = {
    Name = "Private subnet B"
  }
}
