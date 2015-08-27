# packages role
# Serves packages for the infrastructure
class roles::packages inherits roles::base {

  class {'mrepo':
    require => Class['repoforge']
  }
  class {'repoforge': }

  mrepo::repo { 'CentOS-EL7-x86_64':
    ensure    => present,
    update    => 'nightly',
    repotitle => 'CentOS EL7 x86_64',
    arch      => 'x86_64',
    release   => '7',
    urls      => {
      custom => '',
    }
  }
  
  mrepo::repo { 'CentOS-EL6-x86_64':
    ensure    => present,
    update    => 'nightly',
    repotitle => 'CentOS EL6 x86_64',
    arch      => 'x86_64',
    release   => '6',
    urls      => {
      custom => '',
    }
  }


}
