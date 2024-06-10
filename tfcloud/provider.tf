provider "aws" {
  region = "us-west-2" #Oregon
  #  shared_credentials_files = [ "/Users/guliza/.aws/credentials" ]
  #  profile  = "default"
}


terraform {
  cloud {
    organization = "guliza"

    workspaces {
      name = "dev"
    }
  }
}