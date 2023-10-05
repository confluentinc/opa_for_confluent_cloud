# Allow clusters to be created in approved cloud providers

| Provider  | Category       |
|-----------|----------------|
| Confluent | SaaS, Platform |

## Description

A business or organisation may have requirements or restrictions that mean the
infrastructure they provision should exist in a particular cloud provider. This
policy allows clusters to be created only in the cloud providers specified by the
`approved_clouds` parameter, which by default, is set to `[ "AWS" ]`.
