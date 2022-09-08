resource "aws_key_pair" "eksworkshop" {
  key_name   = "eksworkshop"
  public_key = file("~/.ssh/id_rsa.pub")
}
