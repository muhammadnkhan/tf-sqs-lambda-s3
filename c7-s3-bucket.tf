resource "aws_s3_bucket" "messages" {
  bucket        = "${var.project}-bucket-${random_id.suffix.hex}"
  force_destroy = true
  tags = local.common_tags
}

resource "aws_s3_bucket_public_access_block" "messages" {
  bucket                  = aws_s3_bucket.messages.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}