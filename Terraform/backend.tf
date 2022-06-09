terraform {
  backend "s3" {
    bucket = "cicd-bucket-10"
    key    = "terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "LockTable"
  }
}
