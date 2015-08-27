# A role to manage a puppetmaster
class roles::puppetmaster inherits roles::base {

  include puppet::master

}
