# Set up a puppet agent
class puppet::agent (
  $puppet_server = 'puppetmaster',
  $puppet_environment = 'production',
  $splay  = true,
  $run_method = 'service'
) {

  include puppet::agent::packages

  augeas { 'puppet_conf':
    context => '/files/etc/puppet/puppet.conf/main',
    changes => [
      'set logdir /var/log/puppet',
      'set vardir /var/lib/puppet',
      'set ssldir /var/lib/puppet/ssl',
      'set rundir /var/run/puppet',
    ],
  }

  augeas { 'puppet_conf_agent':
    context => '/files/etc/puppet/puppet.conf/agent',
    changes => [
    "set server ${puppet_server}",
    "set environment ${puppet_environment}",
    'set pluginsync true',
    'set report true',
    "set splay ${splay}",
    'set lastrunfile "/var/log/puppet_last_run_summary.yaml"',
    'set lastrunreport "/var/log/puppet_last_run_report.yaml"',
    'set syslogfacility local4',
    'set agent_disabled_lockfile "/var/run/puppet/agent_disabled.lock"',
    'set http_compression true',
    ],
  }

  # custom facts directory
  file { [ '/etc/facter/','/etc/facter/facts.d'] :
    ensure => directory,
    mode   => '0750',
    owner  => 'root',
    group  => 'puppet',
  }

  # automated puppet runs via agent, cron, etc.
  # or 'disabled' to disable automatic runs
  case $run_method {
    'service': {
      service {'puppet':
        ensure    => running,
        enable    => true,
        subscribe => [
          Package['puppet'],
          Augeas['puppet_conf'],
          Augeas['puppet_conf_agent'],
        ],
      }
    }
    'cron': {
      # FIXME: TODO
      service {'puppet':
        ensure => stopped,
        enable => false,
      }
      fail('cron agent scheduling is not implemented yet')
    }
    'disabled': {
      service {'puppet':
        ensure => stopped,
        enable => false,
      }
    }
    default: { fail('puppet run method must be explictly defined') }
  }

}
