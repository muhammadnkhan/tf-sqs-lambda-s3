# Used in S3 bucket name
resource "random_id" "suffix" {
  byte_length = 4
}