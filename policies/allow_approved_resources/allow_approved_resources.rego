package confluent.allow_approved_resources

import future.keywords.in
import future.keywords.if

# ------------------------------------------------------------
# Name:     allow_approved_resources.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Allow only approved resources to be created. Note that if
# additional providers are being used (such as aws or azure)
# those resources (such as keyvaults) should also be included
# in this list.
# ------------------------------------------------------------

approved_resources := [
# Resources as of v1.32.0
  "confluent_api_key",
# "confluent_cluster_link",
  "confluent_connector",
# "confluent_environment",
# "confluent_identity_pool",
# "confluent_identity_provider",
# "confluent_kafka_acl",
  "confluent_kafka_client_quota",
  "confluent_kafka_cluster",
  "confluent_kafka_cluster_config",
# "confluent_kafka_mirror_topic",
  "confluent_kafka_topic",
# "confluent_ksql_cluster",
# "confluent_network",
# "confluent_peering",
# "confluent_private_link_access",
  "confluent_role_binding",
  "confluent_schema",
# "confluent_schema_registry_cluster",
# "confluent_schema_registry_cluster_config",
# "confluent_schema_registry_cluster_mode",
  "confluent_service_account",
# "confluent_subject_config",
# "confluent_subject_mode",
# "confluent_transit_gateway_attachment",
]

# Determine if json structure is from TF Cloud or TF CLI
tfplan := input if {
  input.terraform_version
} else := input.plan if {
  input.plan.terraform_version
}

deny[msg] {
  # All new resources
  rc = tfplan.resource_changes[_]
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # Keep resources that aren't in the approved list
  not rc.type in approved_resources

  # Deny
  msg := sprintf(
    "Unapproved resource (%s)",
    [rc.type]
  )
}
