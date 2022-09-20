resource "aws_s3_bucket" "s3" {
  # oak9: aws_s3_bucket_versioning.versioning_configuration.status bucket versioning is not enabled
  bucket = "my-tf-remediation-bucket"
  # oak9: aws_s3_bucket.logging.target_bucket is not configured
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "arn:{redacted}"
        sse_algorithm     = "AES128"
      }
    }
  }
}
