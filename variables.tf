variable "region" {
  default = "eu-west-2"
  description ="AWS Region"
}


variable "cidr_block" {
  default = "10.0.0.0/16"
  description ="VPC cidr"
}


variable "public-sub-1-cidr_block" {
  default = "10.0.1.0/24"
  description ="public-sub-1 cidr"
}

variable "public-sub-2-cidr_block" {
  default = "10.0.2.0/24"
  description ="public-sub-2 cidr"
}


variable "private-sub-1-cidr_block" {
  default = "10.0.3.0/24"
  description ="private-sub-1 cidr"
}


variable "private-sub-2-cidr_block" {
  default = "10.0.4.0/24"
  description ="private-sub-2 cidr"
}


