##### Platform Provider #####
provider "aws" {
  region = var.aws_region_zone
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}