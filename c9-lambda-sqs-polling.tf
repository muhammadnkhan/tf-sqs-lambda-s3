resource "aws_lambda_event_source_mapping" "sqs_to_lambda2" {
  event_source_arn = aws_sqs_queue.queue.arn
  function_name    = aws_lambda_function.lambda2.arn
  batch_size       = 10
  maximum_batching_window_in_seconds = 5
  enabled          = true
}