resource "aws_vpc" "E-VPC" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "E-VPC"
  }
}

resource "aws_subnet" "public-sub1" {
  vpc_id     = aws_vpc.E-VPC.id
  cidr_block = var.public-sub-1-cidr_block

  tags = {
    Name = "public-sub1"
  }
}


resource "aws_subnet" "public-sub2" {
  vpc_id     = aws_vpc.E-VPC.id
  cidr_block = var.public-sub-2-cidr_block

  tags = {
    Name = "public-sub1"
  }
}

resource "aws_subnet" "private-sub1" {
  vpc_id     = aws_vpc.E-VPC.id
  cidr_block = var.private-sub-1-cidr_block

  tags = {
    Name = "private-sub1"
  }
}


resource "aws_subnet" "private-sub2" {
  vpc_id     = aws_vpc.E-VPC.id
  cidr_block = var.private-sub-2-cidr_block

  tags = {
    Name = "private-sub2"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.E-VPC.id
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.E-VPC.id
  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "public-route-1-association" {
  subnet_id      = aws_subnet.public-sub1.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private-route-1-association" {
  subnet_id      = aws_subnet.private-sub1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.E-VPC.id

  tags = {
    Name = "IGW"
  }
}

resource "aws_route" "public-IGW-route" {
  route_table_id            = aws_route_table.public-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.IGW.id
}