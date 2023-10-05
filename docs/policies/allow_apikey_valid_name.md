# API Key should follow a naming standard

| Provider  | Category       |
|-----------|----------------|
| Confluent | SaaS, Platform |

## Description

When API Keys are created, they are given a free-form description. To aid in
tracking and accountability, this policy ensures that a standard is applied to
this field. This field must match a regular expression, which by default is
`^Owner:.*"`. This can be overridden by proving a custom parameter to the
`apikey_name_regex` param.

Note that this policy applies to the `description` field, not `display_name`.
The `description` field is currently the only field accessible in the Web UI
and Confluent CLI tool.
