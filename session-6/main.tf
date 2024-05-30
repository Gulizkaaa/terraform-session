
# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "5.8.1"
# }

module "ec2" {        
source = "github.com/Gulizkaaa/terraform-session/modules/ec2"
env = "dev"
ami = "ami-01cd4de4363ab6ee8"
instance_type = "t2.micro"
sg = [module.sg.security_group_id] 

} 


module "sg" {
    source = "github.com/Gulizkaaa/terraform-session/modules/sg"
    env = "dev"
    ports = [ "22", "80", "443" ]
}