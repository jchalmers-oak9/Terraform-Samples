resource "aws_s3_bucket" "s3" {
  # oak9: Use s3.bucket.public_access_block_configuration to control S3 bucket public access instead of Canned Access Control Lists (ACLs)
  bucket = "my-tf-remediation-bucket"
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
