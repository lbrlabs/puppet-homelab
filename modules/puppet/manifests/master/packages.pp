# Install the required packages
class puppet::master::packages {

  package { 'puppet-server':
    ensure => present,
  }

  package { 'mod_passenger':
    ensure => present,
  }

  package { 'ruby-devel':
    ensure => present,
  }

  package { 'mod_ssl':
    ensure => present,
  }

  package { 'httpd-devel':

  }

}
