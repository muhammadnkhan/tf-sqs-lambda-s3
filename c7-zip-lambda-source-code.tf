data "archive_file" "lambda1_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_src/lambda1"
  output_path = "${path.module}/lambda_src/lambda1.zip"
}

data "archive_file" "lambda2_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_src/lambda2"
  output_path = "${path.module}/lambda_src/lambda2.zip"
}