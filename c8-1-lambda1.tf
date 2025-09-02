resource "aws_lambda_function" "lambda1" {
  function_name = local.lambda1_name
  role          = aws_iam_role.lambda1.arn
  handler       = "main.handler"
  runtime       = "python3.12"
  filename      = data.archive_file.lambda1_zip.output_path
  source_code_hash = data.archive_file.lambda1_zip.output_base64sha256

  environment {
    variables = {
      QUEUE_URL = aws_sqs_queue.queue.id
    }
  }
  tags = local.common_tags
}