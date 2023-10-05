# Allow topics to have a `retention.ms` in a specified range

| Provider  | Category         |
|-----------|------------------|
| Confluent | Cloud Automation |

## Description

A topic's `retention.ms` is the configuration that determines the period of
time that a message exists within a topic. After the retention period expires,
data may be deleted (or compacted) from the topic.

This policy enforces that a topic's `retention.ms` configuration can be set to
a value between the `topic_retention_period_min` and
`topic_retention_period_max` parameters. By default, this is a range between 1
ms and 1 week.

