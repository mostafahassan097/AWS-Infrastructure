resource "aws_instance" "ApplicatoinInstance" {
  instance_type =var.instancetype
  ami = var.ami# https://cloud-images.ubuntu.com/locator/ec2/ (Ubuntu)
  subnet_id = module.network.pri_sub_1
  security_groups = [aws_security_group.securitygroup-2.id]
  key_name ="myKey"
  disable_api_termination = false
  ebs_optimized = false
  root_block_device {
    volume_size = var.volumesize
  }
  tags = {
    "Name" = "${var.name}-ApplicatoinInstance"
  }
}
