# Stuff goes here
class roles::git inherits roles::base {

  include ::gitlab

  include ::gitlab_mirrors
  

}
