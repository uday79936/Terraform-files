#################################
# Jenkins Security Group
#################################
resource "aws_security_group" "jenkins" {
  name        = "jenkins-sg"
  description = "Security group for Jenkins"
  vpc_id      = var.vpc_id

  # SSH from Ansible only
  ingress {
    description     = "SSH from Ansible"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.ansible.id]
  }

  # Jenkins UI
  ingress {
    description = "Jenkins Web UI"
    from_port   = 8080
    to_port     = 8080
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
    Name = "jenkins-sg"
  }
}

#################################
# SonarQube Security Group
#################################
resource "aws_security_group" "sonarqube" {
  name        = "sonarqube-sg"
  description = "Security group for SonarQube"
  vpc_id      = var.vpc_id

  # SonarQube UI from Jenkins
  ingress {
    description     = "SonarQube Web from Jenkins"
    from_port       = 9000
    to_port         = 9000
    protocol        = "tcp"
    security_groups = [aws_security_group.jenkins.id]
  }

  # SSH from Ansible
  ingress {
    description     = "SSH from Ansible"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.ansible.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sonarqube-sg"
  }
}

#################################
# Nexus Security Group
#################################
resource "aws_security_group" "nexus" {
  name        = "nexus-sg"
  description = "Security group for Nexus"
  vpc_id      = var.vpc_id

  # Nexus UI from Jenkins
  ingress {
    description     = "Nexus Web from Jenkins"
    from_port       = 8081
    to_port         = 8081
    protocol        = "tcp"
    security_groups = [aws_security_group.jenkins.id]
  }

  # SSH from Ansible
  ingress {
    description     = "SSH from Ansible"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.ansible.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nexus-sg"
  }
}

#################################
# Docker Host Security Group
#################################
resource "aws_security_group" "docker" {
  name        = "docker-sg"
  description = "Security group for Docker host"
  vpc_id      = var.vpc_id

  # SSH from Ansible
  ingress {
    description     = "SSH from Ansible"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.ansible.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "docker-sg"
  }
}

#################################
# Ansible Control Node Security Group
#################################
resource "aws_security_group" "ansible" {
  name        = "ansible-sg"
  description = "Security group for Ansible control node"
  vpc_id      = var.vpc_id

  # SSH from anywhere (your laptop)
  ingress {
    description = "SSH from Internet"
    from_port   = 22
    to_port     = 22
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
    Name = "ansible-sg"
  }
}
