# Allow only approved Roles to be assigned

| Provider  | Category       |
|-----------|----------------|
| Confluent | SaaS, Platform |

## Description

Confluent supports
[RBAC](https://docs.confluent.io/cloud/current/access-management/access-control/cloud-rbac.html)
to manage access to resources. Some roles are quite powerful, hence access
should be controlled. This policy allows only certain Roles to be assigned.

The list of allowed Roles is defined by the parameter, `approved_roles`. By default, this is
configured as `[ "DeveloperRead", "DeveloperWrite" ]`.

Currently, this configuration applies to all resources, including topics, Kafka clusters
and KSQL clusters. There may be a requirement for different roles to be allowed on different
resources; if so, a new, custom policy may be required.
