resource "aws_iam_role" "lambda1" {
  name               = "${local.lambda1_name}-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
  tags = local.common_tags
}

# Basic logs policy attched to lambda1 role
resource "aws_iam_role_policy_attachment" "lambda1_basic_logs" {
  role       = aws_iam_role.lambda1.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Least-privilege: send only to our queue
data "aws_iam_policy_document" "lambda1_inline" {
  statement {
    sid     = "AllowSendToSpecificQueue"
    actions = ["sqs:SendMessage"]
    resources = [
      aws_sqs_queue.queue.arn
    ]
  }
}

resource "aws_iam_role_policy" "lambda1_inline" {
  name   = "${local.lambda1_name}-send-to-sqs"
  role   = aws_iam_role.lambda1.id
  policy = data.aws_iam_policy_document.lambda1_inline.json
}