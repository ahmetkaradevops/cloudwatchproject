resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.tf-ec2.id
  allocation_id = aws_eip.eip_manager.id
}
resource "aws_eip" "eip_manager" {
  vpc = true
}
