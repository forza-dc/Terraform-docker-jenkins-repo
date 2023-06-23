terraform {
  backend "s3" {
    bucket = "backend-config-bucket"
    key    = "production"
    region = "eu-west-3"
  }
}