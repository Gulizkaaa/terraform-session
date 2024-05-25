resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg
  tags = {
    Name = "${var.env}-instance"
    Environment = var.env
  }
}

# resource "aws_security_group" "web" {
#   name        = "web"
#   description = "Allow TLS inbound traffic and all outbound traffic"


#   tags = {
#     Name = "web"
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_ports" {
#   count = length(var.ports) // 0,1,2,3
#   security_group_id = aws_security_group.web.id
#   cidr_ipv4         = "0.0.0.0/0" # because of this slash "/" it is considered as string, thus we use ""
#   from_port         = element ( var.ports , count.index )
#   ip_protocol       = "tcp"
#   to_port           = element ( var.ports , count.index )
# }
# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.web.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }




