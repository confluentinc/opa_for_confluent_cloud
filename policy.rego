package confluent
import future.keywords.every

# opa_output=$( opa eval --data policy.rego --input standard-kafka-acls.tfplan.json --format pretty "data.confluent.deny" 2>&1 )

#########################
#  _____     _          #
# | __  |_ _| |___ ___  #
# |    -| | | | -_|_ -| #
# |__|__|___|_|___|___| #
#                       #
#########################

#
# Environments
#

# Prohibit creation of new environments
deny[reason] {
  name := input.resource_changes[_]
  name.type == "confluent_environment"
  "create" in name.change.actions

  display_name := name.change.after.display_name
  reason := sprintf("Prohibit creation of new environments: %s", [display_name])
}

# Prohibit deletion of environments
deny[reason] {
  name := input.resource_changes[_]
  name.type == "confluent_environment"
  "delete" in name.change.actions

  display_name := name.change.after.display_name
  reason := sprintf("Prohibit deletion of environments: %s", [display_name])
}

# Prohibit deletion of environments unless they have a valid prefix (Test-*)
deny[reason] {
  name := input.resource_changes[_]
  name.type == "confluent_environment"
  "delete" in name.change.actions
  display_name := name.change.after.display_name
  not regex.match("^Test-", display_name)

  reason := sprintf("Prohibit deletion of environments without allowed prefix: %s", [display_name])
}

# Environments must be created with a description of at least 10 characters
deny[reason] {
  name := input.resource_changes[_]
  name.type == "confluent_environment"
  "create" in name.change.actions

  display_name := name.change.after.display_name
  description := name.change.after.description
  count(description) <= 10

  reason := sprintf("Prohibit creation of new environments with description length less than 10 characters: %s - '%s'", [display_name, description])
}

# Environments must have a description
deny[reason] {
  name := input.resource_changes[_]
  name.type == "confluent_environment"
  "create" in name.change.actions

  display_name := name.change.after.display_name
  not name.change.after.description

  reason := sprintf("Prohibit creation of new environments without description field: %s", [display_name])
}

# Environment names have a minimum length
deny[reason] {
  name := input.resource_changes[_]
  name.type == "confluent_environment"
  "create" in name.change.actions

  display_name := name.change.after.display_name
  count(display_name) < 10

  reason := sprintf("Prohibit creation of new environments with names less than 10 characters: %s", [display_name])
}

# Environment names start with a given prefix (App-)
deny[reason] {
  name := input.resource_changes[_]
  name.type == "confluent_environment"
  "create" in name.change.actions

  display_name := name.change.after.display_name
  not regex.match("^App-", display_name)

  reason := sprintf("Prohibit creation of new environments that don't begin with a specific prefix: %s", [display_name])
}


