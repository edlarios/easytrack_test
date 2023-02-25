variable "ec2_ami" {
  type = map(any)

  default = {
    us-east-1 = "ami-01795f69f33eb8f90"
  }
}

# Creating a Variable for region

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

