terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.56.0"
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

# Optional: if you want to use agents remove the comment

# data "tfe_agent_pool" "test" {
#   name          = "daniela-agent-pool"
#   organization  = "test"
# }

# resource "tfe_workspace_settings" "test-settings" {
#   workspace_id   = tfe_workspace.test[0].id
#   agent_pool_id  = data.tfe_agent_pool.test.id
#   execution_mode = "agent"
# }
