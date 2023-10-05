# Allow approved connectors to be created

| Provider  | Category       |
|-----------|----------------|
| Confluent | SaaS, Platform |

## Description

There are a number of Confluent managed Connectors that can be created, but not
all of them may be appropriate in every organisation. This policy allows only
certain connectors from being created. The list of approved connectors is
managed by the `approved_connectors` parameter, which by default, is `[
"DatagenSource", "S3_SINK", "SqlServerCdcSource" ]`.
