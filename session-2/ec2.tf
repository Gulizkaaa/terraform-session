


resource "aws_instance" "web" {
  ami           = "ami-01cd4de4363ab6ee8"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-session-instance"
  }
}

# There are twomain blocks in terraform
# 1. Resourse Block = create and manage resources (Infrastructure or AWS Services)
# - Resource Block expects 2 labels
# 2. Data Source Block = ?

# Syntax:
#resource = block
# aws_instance = first_label, (resource type), predefined by Terraform
# web = second_label, (logical name or logical id), defined by author
# ami = argument, (consist of Key/Value, Name/Value), configuration of the resource
# - Key = predefined by terraform, -Value = defined by us(author)

#working directory: 
# - is the directory where you have all terraform configuration file
# - Place where you run Terraform Commands
# - Place where you have terraform Configuration files
# - Root Module

# Terraform has Backend (terraform.tfstate)
# - Local Backend = gets generated in the same working directory
# - Remote Backend = gets generated in the remote system such as s3 bucket

#What is Backend?
# -Stores your Infrasructure Information
# - Shows the desired state of your Infrastructure