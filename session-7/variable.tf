#### Meta Data ##########

variable "env" {
    type = string
    description = "Environment"
    default = "dev"
}
variable "team" {
    type = string
    description = "Team"
    default = "devops"
  
}

variable "project" {
    type = string
    description = "Project"
    default = "nemo"
  
}

variable "app" {
    type = string
    description = "Application"
    default = "dora"
  
}
###### Security group ######

variable "ec2_ports" {
  type = list(object({
    port = number
    protocol = string
  }
  ))
  default = [ {
    port = 80
    protocol = "tcp"
  },
  {
    port = 22
    protocol = "tcp"
  }]
}

variable "alb_ports" {
  type = list(object({
    port = number
    protocol = string
  }
  ))
  default = [ {
    port = 80
    protocol = "tcp"
  },
  {
    port = 443
    protocol = "tcp"
  }]
}

#### Launch Template #######
variable "instance_type" {
    type = string
    description = "Instance Type of EC2"
    default = "t2.micro"
}

variable "zone_id" {
  type = string
  description = "Route53 ZOne ID "
  default = "Z02338361XOFIIY43ZQ4Q"
}