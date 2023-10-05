# Deny Dedicated Cluster creation

| Provider  | Category         |
|-----------|------------------|
| Confluent | Cloud Automation |

## Description

There may be use-cases where the provisioning of new clusters is allowed, but
only Basic or Standard clusters. If there is an attempt to provision a
Dedicated Cluster, this policy will prevent that.
