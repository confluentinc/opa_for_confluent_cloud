# Allow topics to have a `retention.bytes` in a specified range

| Provider  | Category         |
|-----------|------------------|
| Confluent | Cloud Automation |

## Description

A topic's `retention.bytes` is the configuration that determines the maximum
disk usage that a topic can take. Once this value is exceeded, the earliest
messages in the topic will be deleted or compacted.

This policy enforces that a topic's `retention.bytes` configuration can be set
to a value between the `topic_retention_size_min` and
`topic_retention_size_max` parameters. By default, this is a range between 1
byte and and 1 megabyte.

