# consul profiles
class profiles::consul {

  file { '/opt/consul':
    ensure => directory,
  } ->
  class { '::consul': }


}
