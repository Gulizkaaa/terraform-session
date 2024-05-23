locals {
    name = "aws-${var.region}-${var.env}-${var.project}-${var.tier}-rtype" 
    #rtype stands for resource type, you may change it while you are changing the resource
    common_tags = {
            Environment = var.env
            Project = var.project
            Tier = var.tier
            Team = var.team
            Owner = var.owner
            Managed_by = var.managed_by
        }
}
  

# how to reference to Local Value?
# Syntax: local.local_name
# example: local.name, local.common_tags


# Naming Convention: Naming Method, Naming Standard
# Naming Standard is that you or your company come up with

# 1. Provider name: aws, google, azure (cloud provider)
# 2. Regions: us-east-1 or us-west-2
# 3. Environment: dev, qa, stage, prod
# 4. Project name: tom, batman
# 5. Application tier: frontend, backend, database
# 6. Resource Type: ec2, s3, alb, asg, sg, rds

# RDS Instance Naming example:
# Example: provider_name-region-environment-project_name-application_tier-resource_type
# aws-usw2-dev-tom-db-rds 
# aws-usw2-dev-tom-backend-s3
# aws-usw2-dev-tom-frontend-ec2

# Taggin Standard: Common Tags
# 1. Environment: dev, qa, stage, prod
# 2. Project Name: batman, tom, jerry
# 3. Application Tier: frontend, backend, db
# 4. Team: cloud, devops, development
# 5. Owner: guliza@akumosolution.com
# 6. managed_by = cloudformation, terraform, python, manual