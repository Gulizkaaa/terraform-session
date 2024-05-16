### VPV creation ### 

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc"
  }
}

### Public Subnet Creation ###

resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "us-west-2a"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "us-west-2b"
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public-2"
  }
}

resource "aws_subnet" "public_3" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "us-west-2c"
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "public-3"
  }
}

### Private Subnet Creation ###

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "us-west-2a"
  cidr_block = "10.0.11.0/24"

  tags = {
    Name = "private-1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "us-west-2b"
  cidr_block = "10.0.12.0/24"

  tags = {
    Name = "private-2"
  }
}

resource "aws_subnet" "private_3" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "us-west-2c"
  cidr_block = "10.0.13.0/24"

  tags = {
    Name = "private-3"
  }
}

### Route Tables ###

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  # route = [] #I am concerned in this part, i need to double check it after I destroy the infrastructure

  tags = {
    Name = "private-rt"
  }
}

### Internet Gateway ###
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet-gw"
  }
}

### Nat Gateways ### 
resource "aws_nat_gateway" "ngw" {
  connectivity_type = "public"
  allocation_id = aws_eip.nat_eip.id
  subnet_id = aws_subnet.public_1.id

  tags = {
    Name = "nat-gw"
  }
}
 ### Elastic IP allocation ###
 resource "aws_eip" "nat_eip" {
  domain           = "vpc"
}

### Public Subnet Association ###

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_3" {
  subnet_id      = aws_subnet.public_3.id
  route_table_id = aws_route_table.public.id
}

### Private Subnet Association ###

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_3" {
  subnet_id      = aws_subnet.private_3.id
  route_table_id = aws_route_table.private.id
}

### Route Tables - Routes ###

resource "aws_route" "igw_route" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route" "nat_route" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id =  aws_nat_gateway.ngw.id
}