terraform {
  required_providers {
    boundary = {
      source = "hashicorp/boundary"
      version = "1.0.12"
    }
    aws = {
      source = "hashicorp/aws"
      version = "4.31.0"
    }
  }
}

variable "boundary_addr" {
    type = string
}

variable "boundary_auth_method_id" {
    type = string
}

variable "boundary_username" {
    type = string
}

variable "boundary_password" {
    type = string
    sensitive = true
}

provider "boundary" {
    addr                            = var.boundary_addr
    auth_method_id                  = var.boundary_auth_method_id
    password_auth_method_login_name = var.boundary_username
    password_auth_method_password   = var.boundary_password
}

provider "aws" {
  region = "us-east-1"
}