resource "aws_s3_bucket" "s3" {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                               # oak9: AccessControl is not configured
                                                                                                                                                                                                                                                                                                                                                                                                                       # oak9: PublicAccessBlockConfiguration is not configured
                                                                                                                                                                                                                                                                                                                                                               # oak9: PublicAccessBlockConfiguration is not configured
                                                                                                                                                                                                                                                                                                                     # oak9: BucketEncryption is not configured
                                                                                                                                                                                                                                         # oak9: aws_s3_bucket.server_side_encryption_configuration is not configured
                                                                                                                                                                     # oak9: CorsConfiguration.CorsRules.AllowedMethods is not configured
                                                                             # oak9: CorsConfiguration.CorsRules.AllowedMethods should be set to any of GET,HEAD,POST
                                     # oak9: PolicyDocument is not configured
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
