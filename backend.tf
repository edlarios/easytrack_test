terraform {
 backend "s3" {
    bucket = "easytracksterra2023"
    key    = "terraform.tfstate"
    region  = "us-east-1"
  }
}

