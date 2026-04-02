########################################
# S3 Bucket for Terraform State
########################################
resource "aws_s3_bucket" "tf_state" {
  bucket        = "uday-devops-terraform-state"
  force_destroy = true # REQUIRED for versioned bucket destroy

  tags = {
    Name        = "terraform-state-bucket"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

########################################
# Enable Versioning on S3 Bucket
########################################
resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

########################################
# Enable Server-Side Encryption
########################################
resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

########################################
# Block Public Access (MANDATORY)
########################################
resource "aws_s3_bucket_public_access_block" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

########################################
# DynamoDB Table for State Locking
########################################
resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform-lock-table"
  }
}