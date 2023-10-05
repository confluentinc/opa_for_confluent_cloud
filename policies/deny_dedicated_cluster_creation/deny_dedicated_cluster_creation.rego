package confluent.deny_dedicated_cluster_creation

import future.keywords.if

# ------------------------------------------------------------
# Name:     deny_dedicated_cluster_creation.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Prevent the creation of a dedicated cluster, but allow
# standard and basic
# ------------------------------------------------------------

# Determine if json structure is from TF Cloud or TF CLI
tfplan := input if {
  input.terraform_version
} else := input.plan if {
  input.plan.terraform_version
}

deny[msg] {
  # All new cluster configs
  rc = tfplan.resource_changes[_]
  rc.type == "confluent_kafka_cluster"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # No cluster configs should contain non-empty dedicated stanza,
  # cku must also be defined, [{"cku": 1}]
  rc.change.after.dedicated[0].cku

  # Deny
  msg := sprintf(
    "Cluster Config (%s) is defined as a dedicated cluster",
    [rc.change.after.display_name]
  )
}
