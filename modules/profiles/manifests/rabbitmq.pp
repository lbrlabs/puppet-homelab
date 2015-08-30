# RabbitMQ Profile
class profiles::rabbitmq (
  $enabled = true,
  $password = 'changeme'
) {

  if $enabled {
    # we put erlang here because we can't
    # run it inside OpenVZ containers for some reason
    class { '::erlang':
      } ->
    class { '::rabbitmq':
    }

    rabbitmq_vhost { '/sensu': }

    #rabbitmq_user { 'sensu':
    #  password => $password
    #}

    rabbitmq_user_permissions { 'sensu@/sensu':
      configure_permission => '.*',
      read_permission      => '.*.',
      write_permission     => '.*',
      require              => Rabbitmq_vhost['/sensu'],
    }

    diamond::collector { 'RabbitMQCollector':
      sections => {
        '[vhosts]' => {
          '*' => '*'
        }
      }
    }

  }


}
