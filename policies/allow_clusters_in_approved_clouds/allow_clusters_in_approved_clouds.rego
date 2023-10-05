package confluent.allow_clusters_in_approved_clouds

import future.keywords.in
import future.keywords.if

# ------------------------------------------------------------
# Name:     allow_clusters_in_approved_clouds.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Allow clusters to be created, but only in approved cloud
# providers.
# See an alternate Sentinel policy to restrict which cloud
# regions can host clusters.
# ------------------------------------------------------------

# List of approved clouds
approved_clouds := [ "AWS" ]

# Determine if json structure is from TF Cloud or TF CLI
tfplan := input if {
  input.terraform_version
} else := input.plan if {
  input.plan.terraform_version
}

deny[msg] {
  # All new clusters
  rc = tfplan.resource_changes[_]
  rc.type == "confluent_kafka_cluster"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # Keep clusters in invalid clouds
  not rc.change.after.cloud in approved_clouds

  # Deny
  msg := sprintf(
    "Cluster (%s) in non-approved Cloud provider (%s)",
    [rc.change.after.display_name, rc.change.after.cloud]
  )
}
