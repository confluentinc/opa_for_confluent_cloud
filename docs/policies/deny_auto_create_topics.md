# Deny `auto.create.topics.enable`

| Provider  | Category         |
|-----------|------------------|
| Confluent | Cloud Automation |

## Description

The Kafka broker configuration `auto.create.topics.enable` allow topics to be
created as soon as a producer sends a message for that topic. While this can
speed up development times, it can also lead to loss of information (as data is
written to unexpected or incorrect topics).

In general, best practice is to create all required topics so that they can be
accounted for and managed appropraitely. This policy ensures that clusters
cannot be configured to enable this feature.
