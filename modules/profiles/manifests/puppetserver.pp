# profile for puppetserver
class profiles::puppetserver {

  cron::job { 'r10k':
    command => '/opt/puppetlabs/puppet/bin/r10k deploy environment -p --verbose > /var/log/puppetlabs/r10k_deploy_environments.out 2>&1',
    lock    => true,
    minute  => '*/10',
  }

  class { 'r10k':
    remote => 'https://github.com/lbrlabs/puppet-homelab.git',
  }

  class{ 'choria::broker':
    network_broker => true,
    identity       => $::fqdn,
  }

  package { ['hiera-eyaml', 'hiera-eyaml-gpg', 'ruby_gpg']:
    ensure   => present,
    provider => puppetserver_gem,
  }

}
