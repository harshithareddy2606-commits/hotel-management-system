resource "aws_security_group" "employee_sg" {

  name        = "employee-sg"
  description = "Security Group for Employee Management Project"

  ingress {
    description = "SSH"

    from_port   = 22
    to_port     = 22

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"

    from_port   = 80
    to_port     = 80

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Application"

    from_port   = 8080
    to_port     = 8080

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins"

    from_port   = 9090
    to_port     = 9090

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MySQL"

    from_port   = 3306
    to_port     = 3306

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port   = 0
    to_port     = 0

    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "employee-sg"
  }
}
