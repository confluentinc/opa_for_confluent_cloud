package confluent.allow_approved_rbac

import future.keywords.in
import future.keywords.if

# ------------------------------------------------------------
# Name:     allow_approved_rbac.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Only allow specific roles to be assigned
# ------------------------------------------------------------

# Array of approved roles that may be assigned
approved_roles := [ "DeveloperRead", "DeveloperWrite" ]

# Determine if json structure is from TF Cloud or TF CLI
tfplan := input if {
  input.terraform_version
} else := input.plan if {
  input.plan.terraform_version
}

deny[msg] {
  # All new role bindings
  rc = tfplan.resource_changes[_]
  rc.type == "confluent_role_binding"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # Keep role bindings that don't match the regex
  role := rc.change.after.role_name
  not role in approved_roles

  # Userid
  user = rc.change.after.principal

  # Deny
  msg := sprintf(
    "Non-approved role-binding (%s) for user (%s)",
    [role, user]
  )
}
