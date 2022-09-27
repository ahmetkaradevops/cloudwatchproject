This project will create an infrastructure on AWS with use of Terraform.

Requirements:

TASK-1 - an EC2 (Windows 2019 Base server)

TASK-2 - a Lambda fucntion which will turn on the server

TASK-3 - a Lambda fucntion which will shut down the server

TASK-4 - an Alarm which will shut down the servert after 1 hour inactivity

TASK-5 - an Elastic IP which will be associated to server

TASK-6 - required iam roles,Function security groups

TASK-7 - outputs: Elastic IP, instance id, The URL of the Lambda Function to shutdown and run

TASK-8 - a SNS topic which will will email when the server stopped automaticall
