terraform {
  backend "s3" {
    bucket       = "manoj3478kumar"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
