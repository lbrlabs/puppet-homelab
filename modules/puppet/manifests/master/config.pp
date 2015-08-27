# symlink /etc/hiera.yaml to puppet's so that there is no confusion
  file {'/etc/hiera.yaml':
    ensure => link,
    target => '/etc/puppet/hiera.yaml'
  }


  file {'/etc/puppet/hiera.yaml':
    ensure => present,
    source => 'puppet:///modules/puppet/master/hiera.yaml',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }
