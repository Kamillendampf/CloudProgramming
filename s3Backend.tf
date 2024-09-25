# Erstellen einer S3-Bucket für die Anwendungsversionen
resource "aws_s3_bucket" "backendbucket" {
  bucket = "cloudprogrammingbackendbucket"  
}

# Hochladen des Anwendungsarchivs in S3
resource "aws_s3_object" "app_version" {
  bucket = aws_s3_bucket.backendbucket.bucket
  key    = "my-app-v1.zip"  
  source = "C:/CloudProgramming/Website/testServer.zip"  
  etag   = filemd5("C:/CloudProgramming/Website/testServer.zip")
}