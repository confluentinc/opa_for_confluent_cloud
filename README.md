# Confluent OPA Policies for Terraform

This library provides prescriptive OPA policies that can be used to establish
well managed Terraform configuration for Confluent resources.  This library can
be used to establish an initial policy-as-code framework as you onboard new and
additional use-cases in Confluent.

The policies primarily resources created and managed by the [Confluent Provider](https://registry.terraform.io/providers/confluentinc/confluent/latest).

> **NOTE:**
>
> This Policy Library is not an exhaustive list of all of possible policies for
> Confluent configuration.  If you have questions, comments, or have
> identified ways for us to improve this library, please create [a new GitHub
> issue](https://github.com/confluentinc/opa_for_confluent_cloud/issues/new/choose).
>
> We also welcome any contributions that improve the quality of this library!
> To learn more about contributing and suggesting changes to this library,
> refer to the [contributing
> guide](https://github.com/confluentinc/opa_for_confluent_cloud/blob/main/CONTRIBUTING.md).

## Policies included

- All new API Keys should be owned by Service Accounts, not Users ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_apikey_owned_by_service_account.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_apikey_owned_by_service_account/allow_apikey_owned_by_service_account.rego))
- API Keys should have a valid name ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_apikey_valid_name.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_apikey_valid_name/allow_apikey_valid_name.rego))
- Only approved RBAC Roles may be assigned ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_approved_rbac.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_approved_rbac/allow_approved_rbac.rego))
- Only approved resources may be provisioned ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_approved_resources.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_approved_resources/allow_approved_resources.rego))
- New clusters should only be created in specified cloud providers ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_clusters_in_approved_clouds.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_clusters_in_approved_clouds/allow_clusters_in_approved_clouds.rego))
- New clusters should only be created in specified cloud regions ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_clusters_in_approved_regions.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_clusters_in_approved_regions/allow_clusters_in_approved_regions.rego))
- Only specified Connectors may be provisioned ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_connectors_approved.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_connectors_approved/allow_connectors_approved.rego))
- All new Service Accounts should have a valid and descriptive name ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_service_account_valid_name.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_service_account_valid_name/allow_service_account_valid_name.rego))
- Topics should have a partition count in a specified range ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_topic_custom_partition_count.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_topic_custom_partition_count/allow_topic_custom_partition_count.rego))
- Topics should have a `retention.ms` of a speficied range ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_topic_custom_retention_period.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_topic_custom_retention_period/allow_topic_custom_retention_period.rego))
- Topics should have a `retention.bytes` of a specified range ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_topic_custom_retention_size.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_topic_custom_retention_size/allow_topic_custom_retention_size.rego))
- Topic names should follow an appropriate standard ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/allow_topic_valid_name.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/allow_topic_valid_name/allow_topic_valid_name.rego))
- Brokers may not create topics automatically, `auto.create.topics.enable` should be `false` ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/deny_auto_create_topics.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/deny_auto_create_topics/deny_auto_create_topics.rego))
- Prevent the creation of Dedicated clusters, only Basic or Standard clusters ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/deny_dedicated_cluster_creation.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/deny_dedicated_cluster_creation/deny_dedicated_cluster_creation.rego))
- Prevent the deletion of topics ([docs](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/docs/policies/deny_topic_deletion.md) | [OPA](https://github.com/confluentinc/opa_for_confluent_cloud/blob/master/policies/deny_topic_deletion/deny_topic_deletion.rego))

---
