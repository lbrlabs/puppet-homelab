# Main node definitions

node default {

  if $::role {
    notify {'role is not defined, setting to base role': }
    $real_role = 'base'
  } else {
    $real_role = $::role
  }

  include "roles::${real_role}"

}
