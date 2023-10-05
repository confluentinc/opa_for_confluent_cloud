# Allow the creation of API Keys that belong to a Service Account only

| Provider  | Category       |
|-----------|----------------|
| Confluent | SaaS, Platform |

## Description

Confluent allows API keys to be assigned to Users or Service Accounts. To
ensure the security of the platform, access to resources should be made soley
via Service Accounts. This policy ensures new API keys are only issues to
Service Accounts and not Users.
