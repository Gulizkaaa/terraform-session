terraform {
    backend "s3" {
        bucket = "terraform-session-guliza"
        key = "dynamodb/terraform.tfstate" # path to your Remote Backend file (terraform.tfstate)
        region = "us-west-2"
    }
}