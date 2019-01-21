class roles::puppetserver (
) inherits roles::base {

  class { 'r10k':
    remote => 'https://github.com/jaxxstorm/puppet-homelab.git',
  }

}
