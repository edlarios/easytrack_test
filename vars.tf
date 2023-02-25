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

sample_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCJiTZsgk52+F6GEwS0+GyCMliww4vfFBV9Ub2pA0eBOwVAdB+R3cOVZXoEvU5+4ll4/uqSOqLXsYQgAdZy9VySv5BfkPfNbzNkGjzQ8Wz/66oPf4R7gvy8+IM49WOxqKHpG8KF6mxlHEO34zgy2HoJpY6WHtVEMetbZbw+7xV+zDc0dyhtYBwyqKHKWEfg6yZqXcyNQZNjYHrvLhXiLrczbo0mkizfEjo9fpakeU8hgScjZgLNw8p8+16rTcFutMcE8qpm6ZBafjG3Vyn4KjxQZZSvCLE+vaPla48ysDpGBPnRSQHOe4SyvvkMOn3h/ltdXtx5qIuUbr5tgcTAyi8h test@labserver"
