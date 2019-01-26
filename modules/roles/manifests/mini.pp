# Mini PC role
class roles::mini(
) inherits roles::base {

  include ::profiles::docker

  include ::profiles::kubernetes::master

}
