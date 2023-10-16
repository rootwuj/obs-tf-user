terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "3.2.0"
    }
  }
}

provider "rancher2" {
  api_url   = var.rancher_url
  token_key = var.rancher_token_key
  insecure  = true
}

data "rancher2_global_role" "standard_user" {
  name = "User"
}

resource "rancher2_global_role_binding" "test_user_binding" {
  count          = length(var.user_names)
  global_role_id = data.rancher2_global_role.standard_user.id
  user_id        = rancher2_user.test_user[count.index].id
}


resource "rancher2_user" "test_user" {
  count    = length(var.user_names)
  name     = var.user_names[count.index]
  username = var.user_names[count.index]
  password = var.user_password
  enabled  = true
}


# Variable section

variable "rancher_url" {
  type        = string
  description = "URL for Rancher."
}

variable "rancher_token_key" {
  type        = string
  description = "API bearer token for Rancher."
  sensitive   = true
}


variable "user_password" {
  type        = string
  description = "Password for users created through this TF module."
  sensitive   = true
}

variable "user_names" {
  type        = list(string)
  description = "List of usernames for the users you want to create."
}


