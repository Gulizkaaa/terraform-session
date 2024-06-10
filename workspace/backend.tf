terraform {
    backend "s3" {
        bucket = "terraform-session-guliza"
        key = "terraform.tfstate" # path to your Remote Backend file (terraform.tfstate)
        region = "us-west-2"
        workspace_key_prefix = "workspaces"
    }
}

# Currently : default
# Backend File Path: workspaces/terraform.tfstate
# New : dev 
# BAckend file Path : workspaces/dev/terraform.tfstate

# New : qa 
# BAckend file Path : workspaces/qa/terraform.tfstate

# New : stage 
# Backend file Path : workspaces/stage/terraform.tfstate
