# Set up a monitoring hosts
class roles::sensu (
  $opsgenie_customer_key = 'changeme'
)inherits roles::base {

  include profiles::redis
  include ::sensu
  include ::uchiwa

  package { 'sensu-plugins-opsgenie':
    ensure   => installed,
    provider => sensu_gem,
  }

  sensu::handler { 'opsgenie':
    ensure     => present,
    command    => '/opt/sensu/embedded/bin/handler-opsgenie.rb -j /etc/sensu/conf.d/handlers/opsgenie.json',
    severities => ['ok', 'critical'],
    config     => {
      'tags'        => 'sensu',
      'customerKey' => $opsgenie_customer_key,
      'recipients'  => 'main',
    }
  }

}
