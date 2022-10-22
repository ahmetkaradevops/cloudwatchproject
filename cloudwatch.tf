resource "aws_cloudwatch_metric_alarm" "low_cpu_usage" {

  alarm_name = "Lambda Trigger"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  statistic = "Average"
  period = 60
  threshold = 6
  treat_missing_data  = "missing"
  alarm_actions=[
  "${aws_sns_topic.sns_my_lambda_restart_topic.arn}",
  "arn:aws:automate:us-east-1:ec2:stop"]
  depends_on    = [aws_sns_topic.sns_my_lambda_restart_topic
  ]
  dimensions = {
   InstanceId = aws_instance.tf-ec2.id
  }
}
