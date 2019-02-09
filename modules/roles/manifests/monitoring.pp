# Variety of monitoring servers
class roles::monitoring inherits roles::base {

  include ::profiles::prometheus::server

  include ::profiles::grafana

}
