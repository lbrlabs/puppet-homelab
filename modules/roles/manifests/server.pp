# Larger PC role
class roles::server(
) inherits roles::base {

  include ::profiles::docker

}
