# database host
class roles::db (
  $mysql_root_password = 'changeme',

) inherits roles::base {

  include ::mysql::client
  include ::mysql::server::mysqltuner
  include ::mysql::bindings

  class { '::mysql::server':
    root_password           => $mysql_root_password,
    remove_default_accounts => true,
  }



}
