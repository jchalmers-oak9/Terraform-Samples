resource "aws_dynamodb_table" "dynamodb" {
  # oak9: SSESpecification.SSEType is not configured
  # oak9: SSESpecification.SSEType should be set to any of KMS
  # oak9: aws_dynamodb_table.point_in_time_recovery.enabled is not configured
  # oak9: aws_dynamodb_table.point_in_time_recovery.enabled should be set to any of True
  server_side_encryption {
      enabled = false
      kms_key_arn= "arn:{redacted}"
    }
}
