#   Create 3 Bucket
resource "aws_s3_bucket" "staticwbsite" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "staticwbsite" {
  bucket = aws_s3_bucket.staticwbsite.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# make bucket public
resource "aws_s3_bucket_public_access_block" "staticwbsite" {
  bucket = aws_s3_bucket.staticwbsite.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
#   Set public to host static website
resource "aws_s3_bucket_acl" "staticwbsite" {
  depends_on = [
    aws_s3_bucket_ownership_controls.staticwbsite,
    aws_s3_bucket_public_access_block.staticwbsite,
  ]

  bucket = aws_s3_bucket.staticwbsite.id
  acl    = "public-read"
}


resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.staticwbsite.id
  index_document {
    suffix = "index.html"

  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.staticwbsite]
}