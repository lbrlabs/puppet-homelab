# package that don't require config
class profiles::packages {
  
  package { [
      'zsh',
      'unzip',
    ]:
    ensure => installed,
  }

}
