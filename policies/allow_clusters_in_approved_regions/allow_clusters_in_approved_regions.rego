package confluent.allow_clusters_in_approved_regions

import future.keywords.in
import future.keywords.if
import future.keywords.every

# ------------------------------------------------------------
# Name:     allow_clusters_in_approved_regions.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Allow clusters to be created, but only in approved cloud
# regions.
# See an alternate rego policy to restrict which cloud
# providers can host clusters.
# ------------------------------------------------------------

# List of approved regions
# TODO: There may be a need to break this down by cloud provider
approved_regions := [ "^ap-southeast-.*", "^australia.*" ]

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

  # Keep clusters in non-approved regions, which are the cases
  # when every approved_region regex fails
  every region in approved_regions {
    regex.match(region, rc.change.after.region) == false
  }

  # Deny
  msg := sprintf(
    "Cluster (%s) in non-approved cloud region (%s)",
    [rc.change.after.display_name, rc.change.after.region]
  )
}
