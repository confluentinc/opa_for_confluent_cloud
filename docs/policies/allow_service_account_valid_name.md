# Service Accounts should follow a naming strategy

| Provider  | Category       |
|-----------|----------------|
| Confluent | SaaS, Platform |

## Description

To assist in accountability, a naming strategy should be used when provisioning
Service Accounts. This policy allows service accounts that following the naming
strategy, configured by the `service_name_regex` parameter, to be created. By
default, this parameter is set to `"^app-.*$"`, which states that all Service
Account `display_names` must start with `app-`.
