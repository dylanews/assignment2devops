resource "aws_s3_bucket" "assignment2" {
  bucket = "s3699661-devops"
  acl    = "private"

  versioning {
    enabled = true
  }
}

terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "s3699661-devops"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "s3699661-dynamo"
  }
}

resource "aws_dynamodb_table" "s3699661-dynamo" {
  name           = "s3699661-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
