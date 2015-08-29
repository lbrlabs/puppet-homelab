# Set up redis
class profiles::redis {

  include ::redis

  diamond::collector { 'LoadAverageCollector': }

}
