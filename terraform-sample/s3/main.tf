resource "aws_s3_bucket" "s3" {
  # oak9: s3.bucket.website_configuration.redirect_all_requests_to.host_name host name to which requests should be redirected to is not defined
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
