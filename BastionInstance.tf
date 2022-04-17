resource "aws_instance" "BastionInstance" {
  instance_type = var.instancetype
  ami = var.ami # https://cloud-images.ubuntu.com/locator/ec2/ (Ubuntu)
  subnet_id = module.network.pub_sub_1
  security_groups = [aws_security_group.securitygroup-1.id]
  key_name ="private"
  disable_api_termination = false
  ebs_optimized = false
  root_block_device {
    volume_size = var.volumesize
  }

    provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  }

  tags = {
    "Name" = "${var.name}-BastionInstance"
  }
}
