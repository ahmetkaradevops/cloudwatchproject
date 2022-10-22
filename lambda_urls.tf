resource "aws_lambda_function_url" "terraform_lambda_func_for_start_url" {
  function_name      = aws_lambda_function.terraform_lambda_func_for_start.function_name
  authorization_type = "NONE"
}
resource "aws_lambda_function_url" "terraform_lambda_func_for_stop_url" {
  function_name      = aws_lambda_function.terraform_lambda_func_for_stop.function_name
  authorization_type = "NONE"
}

