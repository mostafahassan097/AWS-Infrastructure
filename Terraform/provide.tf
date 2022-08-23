provider "aws" {
  region =var.provider_name

    default_tags {
    tags = {
     Environment = var.name
     Class   = "A"
     Version = "V2.3"
     Purpose = "Amazon"
    }
  }
}
