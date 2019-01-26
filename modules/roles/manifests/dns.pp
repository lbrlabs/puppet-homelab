# Manages a DNS server role
class roles::dns inherits roles::base {

  include ::profiles::coredns

}
