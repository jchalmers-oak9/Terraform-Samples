resource "aws_dynamodb_table" "dynamodb" {
  aws_dynamodb_table.point_in_time_recovery.enabled = true
  # oak9: SSESpecification is not configured
  aws_dynamodb_table.server_side_encryption.enabled = true

}
