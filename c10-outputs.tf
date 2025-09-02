output "s3_bucket_name" {
  value = aws_s3_bucket.messages.bucket
}

output "sqs_queue_url" {
  value = aws_sqs_queue.queue.id
}

output "lambda1_name" {
  value = aws_lambda_function.lambda1.function_name
}

output "lambda2_name" {
  value = aws_lambda_function.lambda2.function_name
}