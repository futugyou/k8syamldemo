resource "aws_efs_mount_target" "mount_target" {
  file_system_id = aws_efs_file_system.file_system.id
  subnet_id      = aws_subnet.subnet.id
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
}
