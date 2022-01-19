# create ec2 instance
resource "aws_instance" "jenkins-server" {
    ami           = var.jenkins_ami
    instance_type = "t2.micro"
    security_groups = [aws_security_group.jenkins_traffic.name]
    key_name = "HarishKey"

#remote exec install java and jenkins
provisioner "remote-exec" {
    inline = [
        "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo",
        "sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key",
        "sudo yum upgrade",
        "sudo amazon-linux-extras install epel -y",
        "sudo yum update -y",
        "sudo yum install java-11 -y",
        "sudo yum install jenkins -y",
        "sudo systemctl daemon-reload",
        "sudo systemctl start jenkins",
    ]
}
connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("key/HarishKey.pem")
}
tags = {
    "Name" = "Jenkins-Server"
}
}
 

  
