variable "region" {
  type    = string
  default = "us-east-1" # or the region you actually want
}

provider "aws" {
  region = var.region
}