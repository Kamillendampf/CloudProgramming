# Erstellen einer S3-Bucket für die Anwendungsversionen
resource "aws_s3_bucket" "k9hubbackendbucket" {
  bucket = "k9hubbackendbucket"  # Stellen Sie sicher, dass der Bucket-Name weltweit eindeutig ist
}

# Hochladen des Anwendungsarchivs in S3
resource "aws_s3_object" "app_version" {
  bucket = aws_s3_bucket.k9hubbackendbucket.bucket
  key    = "my-app-v1.zip"  # Dies ist der Name der Datei im S3-Bucket
  source = "C:/Users/rapha/OneDrive/Desktop/testServer.zip"  # Pfad zur lokalen Datei
  etag   = filemd5("C:/Users/rapha/OneDrive/Desktop/testServer.zip")
}