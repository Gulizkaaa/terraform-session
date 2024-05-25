variable "env" {
  type = string
  description = "this is for environment"
  default = "dev"
}

variable "ami" {
  type = string
  description = "Amazon Machine Image"
  default = "ami-01cd4de4363ab6ee8"
}

variable "instance_type" {
  type = string
  description = "AWS instance type"
  default = "t2.micro"
}

variable "sg" {
  type = list(string)
  description = "security group id"
  default = [ "" ]
}
