terraform {
  backend "s3" {
    bucket = "cicd-task"
    key    = "terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "LockTable"
  }
}
