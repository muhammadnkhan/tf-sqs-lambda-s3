data "archive_file" "lambda1_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_src/lambda1"
  output_path = "${path.module}/lambda_src/lambda1.zip"
  depends_on  = [local_file.lambda1_src]
}

data "archive_file" "lambda2_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_src/lambda2"
  output_path = "${path.module}/lambda_src/lambda2.zip"
  depends_on  = [local_file.lambda2_src]
}