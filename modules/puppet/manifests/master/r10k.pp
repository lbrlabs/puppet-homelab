# r10k config
class puppet::master::r10k (
  $r10k_template = 'puppet/master/r10k.yaml.erb',
  $enable_cron   = true,
  $basegiturl,
) {

  if !$basegiturl {
    fail('you must set a git url to clone your config from')
  }

  package { 'r10k':
    ensure   => present,
    provider => 'gem',
  }

  file { '/var/lib/puppet/r10kcache':
    ensure => directory,
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0750',
  }

  file { '/etc/puppet/r10k.yaml':
    content => template($r10k_template),
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0644',
  }

  if ($enable_cron) {
    $cron_ensure = 'present'
  } else {
    $cron_ensure = 'absent'
  }

  cron {'puppet_master_r10k_deploy_environment':
      ensure  => $cron_ensure,
      command => '/usr/bin/r10k deploy environment -p --verbose --config /etc/puppet/r10k.yaml > /var/log/puppet/r10k_deploy_environments.out 2>&1',
      user    => 'puppet',
      hour    => '*',
      minute  => '*',
    }

}
