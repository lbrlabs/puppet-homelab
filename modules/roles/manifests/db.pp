# Manages a DB server role
class roles::db(
)inherits roles::base {

  include profiles::mysql

}
