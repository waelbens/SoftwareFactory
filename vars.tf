variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "my-key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "my-key.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    us-east-2 = "ami-98023efd"
    eu-west-1 = "ami-844e0bf7"
    eu-west-2 = "ami-5daa463a"
    eu-west-3 = "ami-ad53e2d0"
  }
}
