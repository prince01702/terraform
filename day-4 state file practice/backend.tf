terraform {
  backend "s3" {
    bucket         = "chandreshbucketpractice"
    key            = "env/dev/terraform.tfstate"
    region         = "eu-central-1"
  }
}