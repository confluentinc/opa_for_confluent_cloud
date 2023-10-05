# Allow only specified resources to be provisioned

| Provider  | Category       |
|-----------|----------------|
| Confluent | SaaS, Platform |

## Description

There are a large number of resources that can be managed via the Confluent
Terraform provider. In many situations however, allowing the creation of all
these resources may not be desired. Once the initial environment(s) have been
created, it may make sense from a business or organisational approach to not
allow any new environments to be created. The same applies for clusters; there
may be a use-case for a limited set of clusters that have been pre-provisioned.

This policy allows only certain, specified resources from being created. By
default, the `approved_resources` list is configured as follows:

```
param approved_resources default [
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
```
