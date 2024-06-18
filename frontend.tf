provider "aws" {
  region = "us-east-1"  # Cambia a la región deseada
}

resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "nombre-del-bucket-unico"  # Reemplaza con un nombre único
  acl    = "public-read"

  website {
    index_document = "index.html"
  }
}

output "frontend_url" {
  value = aws_s3_bucket.frontend_bucket.website_endpoint
}
