# a logserver managed with graylog2
class roles::logs inherits roles::base {

  include ::mongodb
  include ::elasticsearch
  ::elasticsearch::instance { 'graylog2': }

  ::elasticsearch::plugin{'mobz/elasticsearch-head':
    instances  => 'graylog2'
  }

}
