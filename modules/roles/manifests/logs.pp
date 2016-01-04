# a logserver managed with graylog2
class roles::logs (
  $graylog2_password_secret = 'changeme',
  $graylog2_root_password_sha2 = 'changeme',
)inherits roles::base {

  include ::mongodb
  include ::elasticsearch
  ::elasticsearch::instance { 'graylog2': }

  ::elasticsearch::plugin{'mobz/elasticsearch-head':
    instances  => 'graylog2'
  }

  class { 'graylog2::repo':
    version => '1.3'
  } ->
  class {'graylog2::server':
    password_secret    => $graylog2_password_secret,
    root_password_sha2 => $graylog2_root_password_sha2,
  }

}
