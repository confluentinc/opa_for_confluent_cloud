# Deny Topic Deletion

| Provider  | Category         |
|-----------|------------------|
| Confluent | Cloud Automation |

## Description

This policy prevents any topics from being deleted. Although it is possible in
terraform to include

```
     lifecycle {
       prevent_destroy = true
     }
```

in order to prevent deletion, this can accidentally or malicious be removed
from the config and result in topic deletion.

This policy can act as an additional safeguard.
