resource "aws_s3_bucket" "s3" { # oak9:  should be set to any of private, authenticateread, logdeliverywrite, bucketownerread, bucketownerfullcontrol, awsexecread
  # oak9: s3.bucket.cors_configuration.cors_rules is not configured
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
