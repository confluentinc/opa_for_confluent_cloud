# Topics should follow a naming standard

| Provider  | Category         |
|-----------|------------------|
| Confluent | Cloud Automation |

## Description

There are many approaches to naming a Kafka topic. Some criteria may include
the topic's department or busisness unit, dataset type, data format (AVRO,
JSON, Protobuf, etc...). 

This policy can be used to enforce a structure around topic naming standards.
This is configured by the `topic_name_regex` parameter, and by default is set
to `^(prod|test)[.][a-z0-9.]+$`. This enforces topic names to start with either
`prod` or `test`, followed by a `.`, followed by lowercase characters, numbers
or `.`. 

More stringent standards can be enforced by modifying the regex in this policy.
