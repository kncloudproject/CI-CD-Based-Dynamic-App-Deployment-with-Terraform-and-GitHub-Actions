# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "kn-pbl-terraform-statefile"
    key            = "cicd/rentzone/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "kn-pbl-terraform-locks"
  }
}