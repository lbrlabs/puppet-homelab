# Base profile applied to all nodes
class profiles::base(
  $encrypted = undef 
){

  notify { 'encrypted':
    message => "Encrypted value is ${encrypted}",
  }

  # Install packages
  class { '::profiles::packages':
    stage => pre
  }
  class { '::profiles::users':
    stage => pre
  }

  include ::puppet
  include ::cron
  include ::sudo

  include ::profiles::consul

  include ::profiles::choria

}
