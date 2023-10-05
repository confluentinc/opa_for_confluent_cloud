package confluent.allow_apikey_owned_by_service_account

import future.keywords.if

# ------------------------------------------------------------
# Name:     allow_apikey_owned_by_service_account.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# All new API keys should be owned by Service Accounts, not
# User accounts.
# ------------------------------------------------------------

# Determine if json structure is from TF Cloud or TF CLI
tfplan := input if {
  input.terraform_version
} else := input.plan if {
  input.plan.terraform_version
}

deny[msg] {
  # All new API keys
  rc = tfplan.resource_changes[_]
  rc.type == "confluent_api_key"
  rc.mode == "managed"
  rc.change.actions[_] == "create"
  apikey = rc.change.after.description

  # Keep API keys owned by user accounts
  owner := rc.change.after.owner[_]
  owner.kind == "User"

  print(apikey, owner.id)
  # Deny
  msg := sprintf(
    "API Key (%s) is owned by a User account (%s)",
    [apikey, owner.id]
  )
}

