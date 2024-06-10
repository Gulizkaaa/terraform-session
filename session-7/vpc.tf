resource "aws_default_vpc" "main" { #resource block is to create and manage resources
    tags = merge(
        { Name = replace(local.name, "rtype", "vpc") },
        local.common_tags
    )
}

resource "aws_default_subnet" "public_subnet_1" {
  availability_zone = "us-west-2a"
  tags = merge(
    { Name = replace(local.name, "rtype", "public-subnet-1") },
      local.common_tags
  )
}

resource "aws_default_subnet" "public_subnet_2" {
  availability_zone = "us-west-2b"
  tags = merge(
    { Name = replace(local.name, "rtype", "public-subnet-2") },
      local.common_tags
  )
}

resource "aws_default_subnet" "public_subnet_3" {
  availability_zone = "us-west-2c"
  tags = merge(
    { Name = replace(local.name, "rtype", "public-subnet-3") },
      local.common_tags
  )
}










# how to turn multiple maps into a single map?
# Merge Function: merges multiple tags into a single map?
# merge function will take two maps, so make sure both your object are maps, in above 
#example we put curly braces to turn it to the maps