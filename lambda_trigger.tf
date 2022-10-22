resource "aws_lambda_event_source_mapping" "my_lambda_restart_mapping" {
  batch_size       = 1
  event_source_arn = aws_sqs_queue.my_lambda_restart_queue.arn
  enabled          = true
  function_name    = "${aws_lambda_function.terraform_lambda_func_for_stop.arn}"
}
