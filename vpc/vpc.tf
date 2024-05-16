### VPV creation ### 

resource "aws_vpc" "web" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}

### Public Subnet Creation ###

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.web.id
  availability_zone = "us-west-2a"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.web.id
  availability_zone = "us-west-2b"
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public-2"
  }
}

resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.web.id
  availability_zone = "us-west-2c"
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "public-3"
  }
}

### Private Subnet Creation ###

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.web.id
  availability_zone = "us-west-2a"
  cidr_block = "10.0.11.0/24"

  tags = {
    Name = "private-1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.web.id
  availability_zone = "us-west-2b"
  cidr_block = "10.0.12.0/24"

  tags = {
    Name = "private-2"
  }
}

resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.web.id
  availability_zone = "us-west-2c"
  cidr_block = "10.0.13.0/24"

  tags = {
    Name = "private-3"
  }
}

### Route Tables ###

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.web.id

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.web.id

  # route = [] #I am concerned in this part, i need to double check it after I destroy the infrastructure

  tags = {
    Name = "private-rt"
  }
}

### Internet Gateway ###
resource "aws_internet_gateway" "intgw" {
  vpc_id = aws_vpc.web.id

  tags = {
    Name = "my-internet-gw"
  }
}

### Nat Gateways ### 
resource "aws_nat_gateway" "web" {
  connectivity_type = "public"
  allocation_id = aws_eip.allocated.id
  subnet_id = aws_subnet.public1.id

  tags = {
    Name = "my-NAT-gw"
  }
}
 ### Elastic IP allocation ###
 resource "aws_eip" "allocated" {
  domain           = "vpc"
}

### Public Subnet Association ###

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public3" {
  subnet_id      = aws_subnet.public3.id
  route_table_id = aws_route_table.public.id
}

### Private Subnet Association ###

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.private.id
}

### Route Tables - Routes ###

resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.intgw.id
}

resource "aws_route" "private" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id =  aws_nat_gateway.web.id
}