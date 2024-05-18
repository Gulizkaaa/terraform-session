

variable "cidr_block" {
    type = list(string) #Data Type
    description = "this is the CIDR blocks of the public subnets" #description of your variable
    default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]  
}

variable "availability_zone" {
    type = list(string)
    description = "this is the availability zones for the subnets"
    default = [ "us-west-2a", "us-west-2b", "us-west-2c" ] 
}

variable "public_nametags" {
    type = list(string)
    description = "this is the name for the subnets"
    default = [ "public-1", "public-2", "public-3" ]

  
}

variable "private_cidr_block" {
    type = list(string) #Data Type
    description = "this is the CIDR blocks of the private subnets" #description of your variable
    default = [ "10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24" ]

}

variable "private_nametags" {
    type = list(string)
    description = "this is the name for the subnets"
    default = [ "private-1", "private-2", "private-3" ]

  
}