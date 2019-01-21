class profiles::packages {
  
  package { [
      'zsh',
    ]:
    ensure => installed,
  }

}
