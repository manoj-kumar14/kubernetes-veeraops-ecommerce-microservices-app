terraform {
  backend "s3" {
    bucket       = "manoj34789kumar"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
