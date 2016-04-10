# Set up a graphite server
class roles::graphite inherits roles::base {

  include ::apache
  include ::graphite
  include ::grafana
}
