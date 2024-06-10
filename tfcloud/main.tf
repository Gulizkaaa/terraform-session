resource "null_resource" "test" {
    provisioner "local-exec" {
        command = "echo 'testing TF Cloud' "
    }
}

resource "aws_sqs_queue" "terraform_sqs" {
    name = "terraform-dev-sqs"
}