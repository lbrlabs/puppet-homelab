# The base role.
# This gets applied to every host, so only include stuff
# You want everywhere
class roles::base {

  # We want puppet everywhere
  include puppet::agent

}

