terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.49.2"
    }
  }
}

provider "tfe" {
  token    = var.token
  hostname = var.hostname
}

resource "tfe_workspace" "test" {
  count        = var.number_of_workspaces
  name         = "tomato_${count.index}"
  organization = "test"
  tag_names    = ["test", "app"]
  auto_apply   = true
  force_delete = true

  vcs_repo {
    identifier     = var.repository
    oauth_token_id = var.oauth_token_id
    
  }
}

