resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow TLS inbound traffic and all outbound traffic"


  tags = {
    Name = "web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ports" {
  count = length(var.ports) // 0,1,2,3
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0" # because of this slash "/" it is considered as string, thus we use ""
  from_port         = element ( var.ports , count.index )
  ip_protocol       = "tcp"
  to_port           = element ( var.ports , count.index )
}
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}




# How to Reference to Resource?
# In order to Reference to Resource, we use labels (first and second)
#syntax is first_label.second_label.attribute
# vpc_security_group_ids - when you see plural "s" it expects list, thus, we need square brackets
# when you use hard coding you use double quotation
# dynamic references doesnt use double quotations
# protocols : icp, udp , slp

#How to Reference to Input Variable?
# Syntax: var.vraiable_name
# Terraform Version:
#0.0.0 - 0.11.9 = ${aws_security_group.web.id}, ${var.env}
#0.12.0 - 1.8.5 = aws_security_group.web.id, var.env