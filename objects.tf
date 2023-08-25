resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.staticwbsite.id
  key          = "index.html"
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
  bucket       = aws_s3_bucket.staticwbsite.id
  key          = "error.html"
  source       = "error.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "profile" {
  bucket = aws_s3_bucket.staticwbsite.id
  key    = "me.png"
  source = "me.png"
  acl    = "public-read"
}
