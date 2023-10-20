variable "oauth_token_id" {
  description = "your oauthentication token id for the VCS connection"
}

variable "repository" {
  description = "your repository github for example munnep/just_another_null_resource"
}

variable "token" {
  description = "token for your tfe environment"
}

variable "hostname" {
  description = "hostname of your tfe environment"
}

variable "number_of_workspaces" {
  description = "number of workspace to create"
}