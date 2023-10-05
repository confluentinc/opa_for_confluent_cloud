package confluent.allow_service_account_valid_name

import future.keywords.if

# ------------------------------------------------------------
# Name:     allow_service_account_valid_name.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# All new service accounts should match a specified regex
# ------------------------------------------------------------

# Service Account name RegEx
service_name_regex := "^app-.*$"

# Determine if json structure is from TF Cloud or TF CLI
tfplan := input if {
  input.terraform_version
} else := input.plan if {
  input.plan.terraform_version
}

deny[msg] {
  # All new service accounts
  rc = tfplan.resource_changes[_]
  rc.type == "confluent_service_account"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # Keep API keys that don't match the regex
  valid_name := regex.match(service_name_regex, rc.change.after.display_name)
  valid_name == false

  # Deny
  msg := sprintf(
    "Service Account (%s) does not match the service_name_regex",
    [rc.change.after.display_name]
  )
}
