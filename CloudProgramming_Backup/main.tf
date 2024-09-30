# Hauptdatei: main.tf

# Terraform Provider für AWS
provider "aws" {
  region = "eu-central-1"
}

# Outputs
output "beanstalk_application_name" {
  value = aws_elastic_beanstalk_application.app.name
}

output "beanstalk_environment_url" {
  value = aws_elastic_beanstalk_environment.k9hub_backend.endpoint_url
}

# Output-Variablen
output "frontend_bucket_name" {
  value = aws_s3_bucket.frontend_bucket.bucket
}

output "frontend_cloudfront_domain" {
  value = aws_cloudfront_distribution.frontend_distribution.domain_name
}