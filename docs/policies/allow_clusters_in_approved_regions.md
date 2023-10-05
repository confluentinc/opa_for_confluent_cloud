# Allow clusters to be created in approved regions

| Provider  | Category       |
|-----------|----------------|
| Confluent | SaaS, Platform |

## Description

A business or organisation may have requirements or restrictions that mean the
infrastructure they provision should exist in a particular cloud provider's
region. This policy allows clusters to be created only in the regions specified
by the `approved_regions` parameter, which by default, is set to `[
"^ap-southeast-*", "^australia*" ]`.  ]`. This parameter is an array of regular
expressions that must match the cloud region.

There may be a requirement in the future to be able to specify the cloud
provider and cloud region, in the case that regions in different cloud
providers become similarly named. In that case, an addtional custom policy may
be developed.
