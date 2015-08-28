# Foreman role
class roles::foreman (
  $foreman_db_database = 'foreman',
  $foreman_db_password = 'foreman',
  $foreman_db_username = 'foreman',
  $foreman_db_host = 'localhost',
  $foreman_admin_username = 'admin',
  $foreman_admin_password = 'admin',
)inherits roles::base {

  class { '::foreman':
    configure_epel_repo    => false,
    db_manage              => false,
    db_type                => 'mysql',
    db_host                => $foreman_db_host,
    db_database            => $foreman_db_database,
    db_username            => $foreman_db_username,
    db_password            => $foreman_db_password,
    admin_username         => $foreman_admin_username,
    admin_password         => $foreman_admin_password,
    ssl                    => false,
    passenger_ruby         => '/usr/bin/ruby193-ruby',
    passenger_ruby_package => 'ruby193-rubygem-passenger-native',
  }

}
