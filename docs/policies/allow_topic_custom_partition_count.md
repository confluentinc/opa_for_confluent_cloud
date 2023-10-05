# Allow topics to have partition counts within a specified range

| Provider  | Category       |
|-----------|----------------|
| Confluent | SaaS, Platform |

## Description

The number of partitions configured for a topic can impact the ingress and
egress rates, producer and consumer performance. In general, more partitions
will lead to better performance. However, a very large number of partitions can
impact the performance of Kafka brokers, and too many partitions may lead to
poor performance or instability.

This policy can be used to limit the number of partitions that may be assigned
to topics, both from a minimum and maximum level. These are configured using
the `topic_partitions_min` and `topic_partitions_max` parameters, and all topics
must include partition counts within that range.

There may be circumstances where differing partition ranges may be suitable,
for example, test topics (topics begining with a `test.` prefix) may have a
partition range of 1 to 3 partitions, while production topics (topics
begining with `production.` prefix) have a partition range of 3 to 12
partitions. If this is the case, a custom policy could be used.
