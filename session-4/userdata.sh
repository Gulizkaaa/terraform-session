#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo 'Hello from the ${environment} instance' > /var/www/html/index.html