# OpenVZ/Virtuozzo Host
class roles::vzhost inherits roles::base {

  # we put erlang  + rabbitmq here because we can't 
  # run it inside OpenVZ containers for some reason
  include profiles::rabbitmq

}
