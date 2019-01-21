# Base profile applied to all nodes
class profiles::base {

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

}
