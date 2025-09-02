resource "aws_sqs_queue" "queue" {
  name                      = "${var.project}-queue"
  visibility_timeout_seconds = 60
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 10
}