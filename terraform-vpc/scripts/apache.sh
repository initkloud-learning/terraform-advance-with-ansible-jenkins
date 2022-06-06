#! /bin/bash

sudo yum update -y
sudo yum install httpd -y
sudo yum install zip unzip wget -y 
sudo systemctl enable httpd
sudo systemctl start httpd
sudo cd /var/www/html 
sudo wget https://www.free-css.com/assets/files/free-css-templates/download/page195/yellow-blog.zip 
sudo unzip yellow-blog.zip
sudo systemctl restart httpd