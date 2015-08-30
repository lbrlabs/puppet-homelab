# Set up a monitoring hosts
class roles::sensu inherits roles::base {

  include profiles::redis
  include ::sensu
  include ::uchiwa

  package { 'sensu-plugins-opsgenie':
    ensure   => installed,
    provider => sensu_gem,
  }

}
