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
}
