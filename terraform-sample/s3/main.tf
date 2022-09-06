resource "aws_s3_bucket" "s3" { # oak9: aws_s3_bucket_public_access_block should be set to any of private, authenticateread, logdeliverywrite, bucketownerread, bucketownerfullcontrol, awsexecread
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
