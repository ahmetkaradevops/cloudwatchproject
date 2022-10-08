output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.tf-ec2.id
}
output "aws_eip" {
  description = "Elastic IP of the EC2 instance"
  value       = aws_instance.tf-ec2.public_ip
}
output "start_url" {
  description = "url for start to EC2 instance"
  value       = aws_lambda_function_url.terraform_lambda_func_for_start_url
}
output "stop_url" {
  description = "url for start to EC2 instance"
  value       = aws_lambda_function_url.terraform_lambda_func_for_stop_url
}
