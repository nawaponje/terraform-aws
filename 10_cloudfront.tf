resource "aws_cloudfront_distribution" "cloudfront-alb" {
  enabled = true
  origin {
    domain_name = aws_lb.web_app_lb.dns_name
    origin_id = "cloudfront-web-alb"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "cloudfront-web-alb"
    forwarded_values {
      headers                 = ["*"]
      query_string            = true
      query_string_cache_keys = []
      cookies {
        forward = "all"
      }
    }
    default_ttl            = 0
    min_ttl                = 0
    max_ttl                = 0
    viewer_protocol_policy = "allow-all"
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