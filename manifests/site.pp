# Main node definitions

node default {

  # Define some run stages
  # Main stage is always declared, so we cant to run some stuff first
  stage { 'pre': }
  stage { 'post': }
  Stage['pre']->Stage['main'] -> Stage['post']

  if ! $role {
    notify {'role is not defined, setting to base role': }
    $role = 'base'
  }
  
  include "roles::${role}"

}
