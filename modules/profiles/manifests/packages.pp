# package that don't require config
class profiles::packages {
  
  package { [
      'zsh',
      'unzip',
      'nagios-plugins',
      'monitoring-plugins',
    ]:
    ensure => installed,
  }

}
