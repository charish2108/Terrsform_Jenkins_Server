# Security Group
resource "aws_security_group" "jenkins_traffic" {
  name        = "jenkins_traffic"
  description = "Allow jenkins and ssh inbound traffic"


dynamic "ingress" {
    for_each = var.ingressrule
    content {
        from_port   = ingress.value
        to_port     = ingress. value
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    }
}

# outbound
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Jenkins-SG"
  }
}