resource "aws_iam_role" "lambda2" {
  name               = "${local.lambda2_name}-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

# Basic logs for lambda2
resource "aws_iam_role_policy_attachment" "lambda2_basic_logs" {
  role       = aws_iam_role.lambda2.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Least-privilege: receive/delete from our queue + put to our bucket
data "aws_iam_policy_document" "lambda2_inline" {
  statement {
    sid     = "SQSConsume"
    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:ChangeMessageVisibility"
    ]
    resources = [aws_sqs_queue.queue.arn]
  }

  statement {
    sid     = "S3Write"
    actions = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.messages.arn}/*"]
  }
}

resource "aws_iam_role_policy" "lambda2_inline" {
  name   = "${local.lambda2_name}-sqs-s3"
  role   = aws_iam_role.lambda2.id
  policy = data.aws_iam_policy_document.lambda2_inline.json
}