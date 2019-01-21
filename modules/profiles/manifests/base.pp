class profiles::base {

  # Install packages
	class { '::profiles::packages':
    stage => pre
  }

  include ::puppet
  include ::cron

  include ::profiles::users

  include ::sudo

}
