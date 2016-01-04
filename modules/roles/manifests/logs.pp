# a logserver managed with graylog2
class roles::logs inherits roles::base {

  include ::mongodb
  include ::elasticsearch

}
