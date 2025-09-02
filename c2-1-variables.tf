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

variable "environment" {
  description = "SDLC Environment"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Team or owner of resource"
  type        = string
  default     = "marketing"
}
