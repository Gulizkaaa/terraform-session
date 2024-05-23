# resource "aws_sqs_queue" "main" {
#   name = "aws-${var.region}-${var.env}-${var.project}-${var.tier}-sqs"
  
#   tags = {
#     Environment = var.env
#     Project = var.project
#     Tier = var.tier
#     Team = var.team
#     Owner = var.owner
#     Managed_by = var.managed_by
#   }
# }

resource "aws_sqs_queue" "main" {
  # name = local.name - it has a logical problem, thus, we use replace function
  name = replace(local.name, "rtype", "sqs")
  tags = local.common_tags
}



