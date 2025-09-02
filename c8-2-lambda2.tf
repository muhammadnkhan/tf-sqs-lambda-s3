resource "aws_lambda_function" "lambda2" {
  function_name = local.lambda2_name
  role          = aws_iam_role.lambda2.arn
  handler       = "main.handler"
  runtime       = "python3.12"
  filename      = data.archive_file.lambda2_zip.output_path
  source_code_hash = data.archive_file.lambda2_zip.output_base64sha256

  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.messages.bucket
    }
  }

  timeout = 30
  tags = local.common_tags
}