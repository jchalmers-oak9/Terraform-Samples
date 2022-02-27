resource "aws_dynamodb_table" "dynamodb" {
  aws_dynamodb_table.point_in_time_recovery.enabled = true
  SSESpecification.SSEType = "KMS"
    server_side_encryption {
      enabled = true
      kms_key_arn= "arn:{redacted}"
    }
}