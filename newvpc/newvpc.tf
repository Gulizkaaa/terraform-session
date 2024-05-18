### VPC Creation ### 

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc"
  }
}


### Public Subnets ###

resource "aws_subnet" "public_subnets" {
  count = 3
  vpc_id     = aws_vpc.main.id
  availability_zone = element ( var.availability_zone , count.index )
  cidr_block = element ( var.cidr_block , count.index )

  tags = {
    Name = element ( var.public_nametags, count.index )
  }
}

### Private Subnets ###

resource "aws_subnet" "private_subnets" {
  count = 3
  vpc_id     = aws_vpc.main.id
  availability_zone = element ( var.availability_zone , count.index )
  cidr_block = element ( var.private_cidr_block , count.index )

  tags = {
    Name = element ( var.private_nametags, count.index )
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
  subnet_id = aws_subnet.public_subnets[0].id

  tags = {
    Name = "nat-gw"
  }
}

 ### Elastic IP allocation ###
 resource "aws_eip" "nat_eip" {
  domain           = "vpc"
}

### Public Subnet Association ###

resource "aws_route_table_association" "public_association" {
    count = 3
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

### Private Subnet Association ###

resource "aws_route_table_association" "private_association" {
  count = 3
  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
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