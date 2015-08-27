# Set up a puppet master
class puppet::master {
  include puppet::master::packages
  include puppet::master::r10k
  include puppet::master::config

}

