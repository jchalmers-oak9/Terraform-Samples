resource "aws_dynamodb_table" "dynamodb" {
  aws_dynamodb_table.point_in_time_recovery.enabled = true
    server_side_encryption {
      enabled = false
      kms_key_arn= "arn:{redacted}"
    }
}