terraform {
  backend "s3" {
    bucket = "terraform-bucket-backend-2"
    key    = "terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "LockTable"
  }
}
