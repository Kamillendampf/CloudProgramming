resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "cloudprogrammingfrontendbucket"
}

resource "aws_s3_bucket_website_configuration" "frontend_bucket" {
  bucket = aws_s3_bucket.frontend_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }

}

resource "aws_s3_bucket_public_access_block" "frontend_bucket" {
  bucket = aws_s3_bucket.frontend_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "frontend_bucket" {
  bucket = aws_s3_bucket.frontend_bucket.bucket
  key    = "index.html"  
  source = "C:/Users/rapha/OneDrive/Desktop/index.html"  
  etag   = filemd5("C:/Users/rapha/OneDrive/Desktop/index.html")
}

# S3-Bucket-Policy, um CloudFront den Zugriff zu ermöglichen
resource "aws_s3_bucket_cors_configuration" "frontend_bucket" {
  bucket = aws_s3_bucket.frontend_bucket.bucket
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    allowed_origins = ["*"] 
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "frontend_bucket" {
  bucket = aws_s3_bucket.frontend_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "AllowGetObjects"
    Statement = [
      {
        Sid       = "AllowPublic"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.frontend_bucket.arn}/**"
      }
    ]
  })
}
