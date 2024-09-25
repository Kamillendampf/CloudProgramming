
# CloudFront-Distribution für das Frontend
resource "aws_cloudfront_distribution" "frontend_distribution" {
  origin {
    domain_name = aws_s3_bucket.frontend_bucket.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.frontend_bucket.id

       custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only" // match-viewer | https-only | http-only
      origin_ssl_protocols   = ["TLSv1.2"] 
    }
  }



  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for my frontend"
  default_root_object = "index.html"
price_class = "PriceClass_100"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.frontend_bucket.id

    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0
  }



  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
