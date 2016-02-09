# Set up a monitoring hosts
class roles::sensu (
  $opsgenie_customer_key = 'changeme',
  $influxdb_sensu_password = 'changeme'
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

  sensu::extension { 'influxdb-extension':
    source => 'puppet:///modules/roles/sensu/influxdb-extension.rb',
    config => {
      hostname       => '192.168.4.19',
      port           => '8086',
      ssl            => false,
      database       => 'sensu',
      username       => 'sensu',
      password       => $influxdb_sensu_password,
      buffer_size    => 100,
      buffer_max_age => 10,
      precision      => 's',
    }
  }

  sensu_check::server { 'check_puppet_lastrun':
    command       => '/opt/sensu/embedded/bin/check-puppet-last-run.rb -s /var/log/puppet_last_run_summary.yaml',
    subscribers   => ['base'],
    event_summary => 'Puppet is failing on this host',
  }

}
