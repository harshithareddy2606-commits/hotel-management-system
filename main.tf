provider "aws" {
region = "eu-west-2"
}

data "aws_ami" "ubuntu" {
most_recent = true

owners = ["099720109477"]

filter {
name   = "name"
values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
}

filter {
name   = "virtualization-type"
values = ["hvm"]
}
}

# Frontend EC2

resource "aws_instance" "frontend" {

ami           = data.aws_ami.ubuntu.id
instance_type = "t3.micro"
key_name      = "hotel-key"

user_data = <<-EOF
#!/bin/bash

apt update -y
apt install nginx -y

mkdir -p /opt/hotel/frontend

cat > /opt/hotel/frontend/index.html << 'HTML'

<!DOCTYPE html>

<html>
<head>
<title>Hotel Management System</title>
</head>
<body>
<h1>Hotel Management System</h1>
</body>
</html>
HTML

cp /opt/hotel/frontend/index.html /var/www/html/index.html

systemctl enable nginx
systemctl start nginx
EOF

tags = {
Name = "Hotel-Frontend"
}
}

# Backend EC2

resource "aws_instance" "backend" {

ami           = data.aws_ami.ubuntu.id
instance_type = "t3.micro"
key_name      = "hotel-key"

user_data = <<-EOF
#!/bin/bash

apt update -y
apt install python3 python3-pip -y

mkdir -p /opt/hotel/backend
EOF

tags = {
Name = "Hotel-Backend"
}
}

# Database EC2

resource "aws_instance" "database" {

ami           = data.aws_ami.ubuntu.id
instance_type = "t3.micro"
key_name      = "hotel-key"

user_data = <<-EOF
#!/bin/bash

apt update -y
apt install mysql-server -y

mkdir -p /opt/hotel/database

systemctl enable mysql
systemctl start mysql
EOF

tags = {
Name = "Hotel-Database"
}
}
