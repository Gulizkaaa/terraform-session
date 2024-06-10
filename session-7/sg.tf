# 2 Security Groups
# 1 for Application Load Balancer
# 1 for EC2 instances 

resource "aws_security_group" "ec2" {
  name        = replace(local.name, "rtype", "ec2-sg")
  description = "This is a security group for EC2 Instances"
  vpc_id = aws_default_vpc.main.id
  tags = merge(
    { Name = replace(local.name, "rtype", "ec2-sg")},
    local.common_tags
  )
  
egress {
        from_port = 0
        to_port = 0
        protocol =  "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    dynamic "ingress" {
        for_each = var.ec2_ports
        iterator = dynamic
        content {
            from_port = dynamic.value.port #here ports is the name of the iterator
            to_port = dynamic.value.port
            protocol = dynamic.value.protocol
           security_groups = [ aws_security_group.alb.id ]
        }

    }        
}


resource "aws_security_group" "alb" {
  name        = replace(local.name, "rtype", "alb-sg")
  description = "This is a security group for ALB"
  vpc_id = aws_default_vpc.main.id
  tags = merge(
    { Name = replace(local.name, "rtype", "alb-sg")},
    local.common_tags
  )
  
egress {
        from_port = 0
        to_port = 0
        protocol =  "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    dynamic "ingress" {
        for_each = var.alb_ports
        iterator = dynamic
        content {
            from_port = dynamic.value.port #here ports is the name of the iterator
            to_port = dynamic.value.port
            protocol = dynamic.value.protocol
            cidr_blocks = [ "0.0.0.0/0" ]
        }

    }        
}

