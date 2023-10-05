policy "allow_apikey_owned_by_service_account" {
  query = "data.confluent.allow_apikey_owned_by_service_account.deny"
  enforcement_level = "advisory"
}

policy "allow_apikey_valid_name" {
  query = "data.confluent.allow_apikey_valid_name.deny"
  enforcement_level = "advisory"
}

policy "allow_approved_rbac" {
  query = "data.confluent.allow_approved_rbac.deny"
  enforcement_level = "advisory"
}

policy "allow_approved_resources" {
  query = "data.confluent.allow_approved_resources.deny"
  enforcement_level = "advisory"
}

policy "allow_clusters_in_approved_clouds" {
  query = "data.confluent.allow_clusters_in_approved_clouds.deny"
  enforcement_level = "advisory"
}

policy "allow_clusters_in_approved_regions" {
  query = "data.confluent.allow_clusters_in_approved_regions.deny"
  enforcement_level = "advisory"
}

policy "allow_connectors_approved" {
  query = "data.confluent.allow_connectors_approved.deny"
  enforcement_level = "advisory"
}

policy "allow_service_account_valid_name" {
  query = "data.confluent.allow_service_account_valid_name.deny"
  enforcement_level = "advisory"
}

policy "allow_topic_custom_partition_count" {
  query = "data.confluent.allow_topic_custom_partition_count.deny"
  enforcement_level = "advisory"
}

policy "allow_topic_custom_retention_period" {
  query = "data.confluent.allow_topic_custom_retention_period.deny"
  enforcement_level = "advisory"
}

policy "allow_topic_custom_retention_size" {
  query = "data.confluent.allow_topic_custom_retention_size.deny"
  enforcement_level = "advisory"
}

policy "allow_topic_valid_name" {
  query = "data.confluent.allow_topic_valid_name.deny"
  enforcement_level = "advisory"
}

policy "deny_dedicated_cluster_creation" {
  query = "data.confluent.deny_dedicated_cluster_creation.deny"
  enforcement_level = "mandatory"
}

policy "deny_topic_deletion" {
  query = "data.confluent.deny_topic_deletion.deny"
  enforcement_level = "advisory"
}
