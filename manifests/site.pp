# Main node definitions

node default {

  if $role {
    notify {'role is not defined, setting to base role': }
    $role = 'base'
  }

  include "roles::${role}"

}
