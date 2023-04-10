terraform {
  required_providers {
    aws = {
      version = ">= 4.0"
      source  = "hashicorp/aws"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
      version = "2.3.2"
    }
  }

  required_version = ">= 1.3.4"
}
