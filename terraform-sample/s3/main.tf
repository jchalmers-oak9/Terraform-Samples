resource "aws_s3_bucket" "s3" {
  bucket = "my-tf-remediation-bucket"
  acl    = "private" # oak9: aws_s3_bucket_acl.acl should be set to any of publicread, publicreadwrite, authenticateread

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
