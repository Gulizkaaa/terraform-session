module "ec2" {        #every module should have unique name
###### Module Argument ################
 source = "../../modules/ec2"  # required argument, where you specify the location of child module
# version = "" # oprional argument, where you specify the version of your child module
## when you store your child module locally then you do not need version for your chld module
## if your child module is kepl remotely then you need it 
# source = "github.com/Gulizkaaa/terraform-session/tree/main/modules/ec2"
###### Input Variable that are required for the Child Module ######
env = "dev"
ami = "ami-01cd4de4363ab6ee8"
instance_type = "t2.micro"
sg = [module.sg.security_group_id] 
#if you declared your variable type as a list(string), 
#make sure to indicate the same type 
} 

# Syntax: module.module_name.output_name

module "sg" {
    source = "../../modules/sg"
    # source = "github.com/Gulizkaaa/terraform-session/tree/main/modules/sg"
    env = "dev"
    ports = [ "22", "80", "443" ]
}