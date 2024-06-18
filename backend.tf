terraform {
  backend "s3" {
    bucket = "nombre-del-bucket-terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
