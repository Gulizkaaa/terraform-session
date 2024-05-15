terraform {
    required_version = "~>1.8.3" # my terraform version
    required_providers {   #provider version
        aws = {
          source = "hashicorp/aws" #this hashicorp/aws is a public provider, 
                                  #however, there might be private providers as well    
          version = "~> 5.49.0"
        }
    }
}

#1.8.3 = Symentic Versioning
# 1 = Najor (Upgrade) = Main Changes
# 8 = Minor (Update) = Features/Enhancement
# 3 = Patch (Patching) = Fix Vulnerabilties
# 1.5.0 --> 1.5.x. = (>=1.5, <1.6)
# 5.49.0 --> 5.49.x = (>=5.49.0, <5.50.0), (~>5.49.0)
# Lazy Constraints: ~>