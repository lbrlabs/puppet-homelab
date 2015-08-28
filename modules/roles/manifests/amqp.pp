# AMQP Host
class roles::amqp (
  $password = 'changeme'
) inherits roles::base {

  class { 'erlang':
  } ->
  class { 'rabbitmq':
  }

  rabbitmq_vhost { '/sensu': }

  rabbitmq_user { 'sensu':
    password => $password
  }

  rabbitmq_user_permissions { 'sensu@sensu':
    configure_permission => '.*',
    read_permission      => '.*.',
    write_permission     => '.*',
    require              => Rabbitmq_vhost['/sensu'],
  }

}
