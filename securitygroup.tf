resource "aws_security_group" "usine_logicielle" {
  vpc_id = "${aws_vpc.main.id}"
  name = "usine_logicielle"
  description = "security group that allows TCP ports and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 9000
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
tags {
    Name = "usine_logicielle"
  }
}