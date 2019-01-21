# Install and configure a puppetserver
class roles::puppetserver (
) inherits roles::base {

  include ::profiles::puppetserver

}
