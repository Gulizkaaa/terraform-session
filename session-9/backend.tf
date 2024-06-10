terraform {
    backend "s3" {
        bucket = "terraform-session-guliza"
        key = "session-9/terraform.tfstate" # path to your Remote Backend file (terraform.tfstate)
        region = "us-west-2"
        dynamodb_table = "terraform-lock"
        encrypt = true
    }
}
