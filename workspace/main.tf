resource "aws_sqs_queue" "main" {
    name = "${terraform.workspace}-sqs"

}

# how to reference to workspace?
# Syntax: terrafrom.workspace 