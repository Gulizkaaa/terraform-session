locals {
    name = "aws-${var.team}-${var.project}-${var.app}-rtype-${var.env}"
    common_tags = {
        Environment = var.env
        Team = var.team
        Application = var.app
        Project = var.project
        Owner = "guliza"
        Managed_by = "Terraform"
    }
    asg_tags = merge(
        { Name = replace(local.name, "rtype", "asg") },
        local.common_tags
    )
}

#Name : aws-team-project-app-env
#Tags: Environment,Team , Application