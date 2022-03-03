resource "aws_dynamodb_table" "dynamodb" {
  aws_dynamodb_table.point_in_time_recovery.enabled = true
  SSESpecification.SSEType = "KMS"

}
