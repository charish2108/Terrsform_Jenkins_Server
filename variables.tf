#var region
variable "region" {
  description = "jenkins web server"
  type = string
  default = "us-west-2"
}

# list port of SG
variable "ingressrule" {
  type = list(number)
  default = [8080,22]
}

# AMI EC2 Linux
variable "jenkins_ami" {
  default = "ami-066333d9c572b0680"
} 