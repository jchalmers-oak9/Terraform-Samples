resource "aws_s3_bucket" "s3" { # CorsConfiguration.CorsRules.AllowedMethods is not configured in file jchalmers-oak9-Terraform-Samples/terraform-sample/s3/main.tf on line: 1
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
