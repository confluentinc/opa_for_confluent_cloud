package confluent.deny_topic_deletion

import future.keywords.if

# ------------------------------------------------------------
# Name:     deny_topic_deletion.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Prevent any topics from being deleted. Although it is
# possible in terraform to include
#     lifecycle {
#       prevent_destroy = true
#     }
# in order to prevent deletion, this can be removed from
# the config and result in topic deletion.
# This policy can act as an additional safeguard.
# ------------------------------------------------------------

# Determine if json structure is from TF Cloud or TF CLI
tfplan := input if {
  input.terraform_version
} else := input.plan if {
  input.plan.terraform_version
}

deny[msg] {
  # All deleted topics
  rc = tfplan.resource_changes[_]
  rc.type == "confluent_kafka_topic"
  rc.mode == "managed"
  rc.change.actions[_] == "delete"

  # Deny
  msg := sprintf(
    "Attempted deletion of topic (%s)",
    [rc.name]
  )
}
