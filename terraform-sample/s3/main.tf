resource "aws_s3_bucket" "s3" {
  bucket = "my-tf-remediation-bucket"
  acl    = "private"

  tags = {
    # oak9: Define Tags for S3 bucket
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
