variable "instance_type" {
    type = string
    description = "Instance Type"
    default = "t2.micro"
}

variable "ami" {
    type = string
    description = "AMI"
    default = "ami-01cd4de4363ab6ee8"
  
}