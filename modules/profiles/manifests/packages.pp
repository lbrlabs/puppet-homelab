# package that don't require config
class profiles::packages {
  
  package { [
      'zsh',
    ]:
    ensure => installed,
  }

}
