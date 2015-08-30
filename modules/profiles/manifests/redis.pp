# Set up redis
class profiles::redis {

  include ::redis

  diamond::collector { 'RedisCollector': }

  package { 'sensu-plugins-redis':
    ensure   => installed,
    provider => sensu_gem,
  }
}
