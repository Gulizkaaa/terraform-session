variable "region" {
  type = string
  description = "AWS region"
  default = "us-west-2"
}

variable "env" {
  type = string
  description = "Environment"
  default = "dev"
}

variable "project" {
  type = string
  description = "this is the project name"
  default = "jerry"
}

variable "tier" {
  type = string
  description = "Application Tier"
  default = "backend"
}

variable "team" {
  type = string
  description = "Team Name"
  default = "cloud"
}

variable "owner" {
  type = string
  description = "Project Owner Name"
  default = "guliza"
}

variable "managed_by" {
  type = string
  description = "Managed by"
  default = "terraform"
}