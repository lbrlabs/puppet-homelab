# Install the Puppet agent and related things
class profiles::puppetagent {

  # Include the Puppet agent
  include puppet::agent

  # Include the diamond collector with it
  diamond::collector { 'PuppetAgentCollector':
    require => Package['PyYAML'],
  }

  package { 'PyYAML':
    ensure => 'installed',
  }

  package { 'sensu-plugins-puppet':
    ensure   => installed,
    provider => sensu_gem
  }

  sensu_check::client { 'check_puppet_lastrun':
    command       => '/opt/sensu/embedded/bin/check-puppet-last-run.rb -s /var/log/puppet_last_run_summary.yaml',
    event_summary => 'Puppet is failing on this host',
  }
}
