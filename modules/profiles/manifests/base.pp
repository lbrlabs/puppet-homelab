class profiles::base {

  # Install packages
	class { '::profiles::packages':
    stage => pre
  }

  include ::puppet

}
