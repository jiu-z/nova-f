provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "adozoo-2023-test-bucket"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_dynamodb_table" "tf-state-table" {
  name           = "tf-state-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}