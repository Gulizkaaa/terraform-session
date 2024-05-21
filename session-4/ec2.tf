resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2023.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.web.id ] 
  user_data = data.template_file.userdata.rendered #
  #user_data = file(userdata.sh) #get an output of the file, it is like cat command
  #when you use file function in parantheses you need to give the absolute path
  tags = {
    Name = "${var.env}-instance", 
    Name1 = format("%s-insatnce", var.env) #dev-instance 
    Environment = var.env
  }
}

# How to references Data Source? 
# Syntax: data.first_label.second_label.attribute -important is to have word data
# Example: data.aws_ami.amazon_linux_2023.id