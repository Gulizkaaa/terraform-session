

resource "aws_security_group" "main" {
  name        = "main"
  description = "Allow SSH and HTTP "

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // all ports, protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "main" {
    key_name = "IMacLocalKey"
    public_key = file("~/.ssh/id_rsa.pub")
  
}


resource "aws_instance" "web" {
    depends_on = [ null_resource.main ]
    ami           = "ami-01cd4de4363ab6ee8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.main.id ]
  key_name = aws_key_pair.main.id

  provisioner "file" {
    source = "/Users/guliza/Desktop/terraform/terraform-session/session-8/index.html"
    #the place or path, where the file is, 
    destination = "/tmp/index.html" # because it is accessible to all users, 
    #the path where you want to send yourfile to, remote machine

    connection {
      type = "ssh"
      user = "ec2-user" #username
      host =  self.public_ip # if everything is in the same block you can reference like this 
      #Public IP of the EC2 Instance
      private_key = file("~/.ssh/id_rsa") #private key of your local machine 
    }
  }

  provisioner "remote-exec" {
    inline = [ "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
      ]
    connection {
      type = "ssh"
      user = "ec2-user" #username
      host =  self.public_ip # if everything is in the same block you can reference like this 
      #Public IP of the EC2 Instance
      private_key = file("~/.ssh/id_rsa") #private key of your local machine 
    }
  }
}


resource "null_resource" "main" {
    provisioner "local-exec" {
        command = "echo 'Testing local exec, file and remote-exec provisioners' > index.html"

      
    }
  
}