output "reference_output" {
    description = "This gives th output of reference"
    value = aws_subnet.private_subnets[*].id #firstlabel,sedondlabel and attribute (you can find attribute in Documentation)
}
