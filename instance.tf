resource "aws_instance" "main" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "m5.large"
  tags {
      Name = "SoftwareFactory"
  }

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.usine_logicielle.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"


  provisioner "file" {
    source = "requirements.sh"
    destination = "/tmp/requirements.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/requirements.sh",
      "sudo /tmp/requirements.sh"
    ]
  } 
  provisioner "local-exec" {
     command = "echo ${aws_instance.main.private_ip} >> private_ips.txt"
  }
  connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}

  # outputs
  output "ip" {
    value = "${aws_instance.main.public_ip}"
  }




