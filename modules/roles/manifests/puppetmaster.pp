# A role to manage a puppetmaster
class roles::puppetmaster inherits roles::base {

  include puppet::master

  ::consul::service { 'puppetmaster':
    port => '8140',
    tags => ['puppet'],
  }

}
