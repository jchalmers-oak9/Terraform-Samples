resource "aws_s3_bucket" "s3" {
  # oak9: aws_s3_bucket_acl.acl is not configured
  # oak9: PublicAccessBlockConfiguration is not configured
  # oak9: aws_s3_bucket_public_access_block.block_public_acls is not configured
  # oak9: aws_s3_bucket_public_access_block.block_public_policy is not configured
  # oak9: aws_s3_bucket_public_access_block.ignore_public_acls is not configured
  # oak9: aws_s3_bucket_public_access_block.restrict_public_buckets is not configured
  # oak9: BucketEncryption is not configured
  # oak9: aws_s3_bucket.server_side_encryption_configuration is not configured
  # oak9: CorsConfiguration.CorsRules.AllowedMethods is not configured
  # oak9: CorsConfiguration.CorsRules.AllowedMethods should be set to any of GET,HEAD,POST
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
