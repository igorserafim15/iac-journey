resource "aws_s3_bucket" "remote-state" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "remote-state-bucket-versioning" {
  bucket = aws_s3_bucket.remote-state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [
    aws_s3_bucket.remote-state
  ]
}

resource "aws_dynamodb_table" "lock-table" {
  name = "tflock-${aws_s3_bucket.remote-state.bucket}"
  read_capacity = 5
  write_capacity = 5
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}