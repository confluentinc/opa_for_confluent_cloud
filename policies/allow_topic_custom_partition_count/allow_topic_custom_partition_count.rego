package confluent.allow_topic_custom_partition_count

import future.keywords.in
import future.keywords.if

# ------------------------------------------------------------
# Name:     allow_topic_custom_partition_count.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Allow topics to specify the number of partitions, given
# a minimum and maximum size
# TODO: This is a fixed range of partitons for all topics,
# but there may be cases where some prefixed topics can have
# different ranges. Maybe introduce this if there demand.
# ------------------------------------------------------------

# Minimum and maximum partition counts
topic_partitions_min := 3
topic_partitions_max := 12

# `or` condition
is_bad(topic) {
  to_number(topic.change.after.partitions_count) < topic_partitions_min
}
is_bad(topic) {
  to_number(topic.change.after.partitions_count) > topic_partitions_max
}

# Determine if json structure is from TF Cloud or TF CLI
tfplan := input if {
  input.terraform_version
} else := input.plan if {
  input.plan.terraform_version
}

deny[msg] {
  # All new topics
  rc = tfplan.resource_changes[_]
  rc.type == "confluent_kafka_topic"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # If using the default, partitions_count is not defined
  # Defaults are always allowed to no need to check further
  # Check if partitions_count is defined, pass if not defined
  rc.change.after["partitions_count"]
  # now check if partitions_count fails either condition
  is_bad(rc)

  # Deny
  msg := sprintf(
    "Topic (%s) does not meet partition requirements",
    [rc.change.after.topic_name],
  )
}
