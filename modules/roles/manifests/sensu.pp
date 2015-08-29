# Set up a monitoring hosts
class roles::sensu inherits roles::base {

  include ::redis
  include ::sensu
  include ::uchiwa

}
