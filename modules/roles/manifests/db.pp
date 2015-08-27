# database host
class roles::db (
  $mysql_root_password = 'changeme',

) inherits roles::base {

  include ::mysql::client
  include ::mysql::server::mysqltuner
  include ::mysql::bindings

  $override_options = {
    'mysqld' => {
      'bind-address' => '0.0.0.0'
    }
  }

  class { '::mysql::server':
    root_password           => $mysql_root_password,
    remove_default_accounts => true,
    override_options        => $override_options
  }



}
