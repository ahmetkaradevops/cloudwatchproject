### IAM Role and Policy ###
# Allows Lambda function to describe, stop and start EC2 instances
resource "aws_iam_role" "lambda_role" {
  name               = "Spacelift_Test_Lambda_Function_Role"
  assume_role_policy = "${data.template_file.lambda-policy.rendered}"
}
data "template_file" "lambda-policy" {
  template = "${file("${path.module}/policies/lambda.json")}"
}
resource "aws_iam_policy" "iam_policy_for_lambda" {

  name        = "aws_iam_policy_for_terraform_aws_lambda_role"
  path        = "/"
  description = "AWS IAM Policy for managing aws lambda role"
  policy = "${data.template_file.lambda_role-policy.rendered}"
}
data "template_file" "lambda_role-policy" {
  template = "${file("${path.module}/policies/lambda_role.json")}"
}
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
}
data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "~/Desktop/try/python/"
  output_path = "~/Desktop/try/python/start_instances.zip"
}
resource "aws_lambda_function" "terraform_lambda_func_for_start" {
  filename      = "~/Desktop/try/python/start_instances.zip"
  function_name = "Spacelift_Test_Lambda_Function_for_start"
  role          = aws_iam_role.lambda_role.arn
  handler       = "start_instances.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}
resource "aws_lambda_function" "terraform_lambda_func_for_stop" {
  filename      = "~/Desktop/try/python/stop_instances.zip"
  function_name = "Spacelift_Test_Lambda_Function_for_stop"
  role          = aws_iam_role.lambda_role.arn
  handler       = "stop_instances.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}
