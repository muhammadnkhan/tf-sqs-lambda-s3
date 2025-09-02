variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Prefix for resource names"
  type        = string
  default     = "hello-sqs-s3"
}
