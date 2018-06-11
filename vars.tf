variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-3"
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
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
    eu-west-3 = "ami-ad53e2d0"
  }
}
