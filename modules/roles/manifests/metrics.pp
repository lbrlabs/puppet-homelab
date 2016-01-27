# Overall metrics role
class roles::metrics inherits roles::base {

  include ::influxdb::server

}
