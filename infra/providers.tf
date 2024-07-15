# terraform {
#   required_providers {
#     digitalocean = {
#       source  = "digitalocean/digitalocean"
#       version = "~> 2.0"
#     }

#     aws = {
#       source  = "hashicorp/aws"
#       version = "5.36.0"
#     }
#   }

#   backend "s3" {}
# }

provider "aws" {
  region = "us-east-1"
}
