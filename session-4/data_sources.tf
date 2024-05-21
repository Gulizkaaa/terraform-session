data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.*"]
  }
## Semantic Versioning: 
## Major.minor.patch - 20240513 - the date when AWS patch this AMI
#["al2023-ami-2023.4.20240513.0-kernel-6.1-x86_64"] - it is hard coding, thus we cannot
# kepp it in this way. We cah change starting from 20240513.0-kernel-6.1 to *

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

#Data Source Block: Fetch the data from Pre-existing Resource
#Syntax: data "first_label""second_label" - same as resource, 
#first label defined by terraform, and second is logical ID and it is defined by us

data "template_file" "userdata"{
    template = file("userdata.sh")
    vars = {
        environment = var.env
    }
}