# Variety of monitoring servers
class roles::monitoring {

  include ::profiles::prometheus::server

  include ::profiles::grafana

}
