terraform {
    required_version = "~>1.8.3" # my terraform version
    required_providers {   #provider version
        aws = {
          source = "hashicorp/aws" #this hashicorp/aws is a public provider, 
                                  #however, there might be private providers as well    
          version = "~> 5.49.0"   #
        }
    }
}