resource "random_id" "bucket_suffix" {
  byte_length = 4
}
resource "aws_s3_bucket" "artifact_bucket" {
  bucket = "${var.bucket_name}-${random_id.bucket_suffix.hex}"

  tags = {
    Name = var.bucket_name
  }
}