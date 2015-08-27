# The base role.
# This gets applied to every host, so only include stuff
# You want everywhere
class roles::base {

  # We want puppet everywhere
  include profile::puppetagent

  class { 'profiles::yumrepos':
    stage => pre,
  }

  # We need stats from everything, so install diamond everywhere
  include ::diamond

  # Collect some base system metrics
  # TODO: Include diamond in here?
  include profiles::system_metrics

}

