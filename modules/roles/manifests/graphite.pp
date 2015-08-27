# Set up a graphite server
class roles::graphite inherits roles::base {

  include ::graphite
  include ::grafana

}
