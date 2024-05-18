variable "env" {
    type = string #Data Type
    description = "this variable is for environment" #description of your variable
    default = "dev"  #default value, dev means developer 
}

variable "ports" {
    type = list(number)
    description = "a list of port numbers"
    default = [ 22, 80, 3306, 443 ]#value for the variable 
  
}