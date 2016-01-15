# a logserver managed with graylog2
class roles::logs (
  $graylog2_password_secret = 'changeme',
  $graylog2_root_password_sha2 = 'changeme',
  $graylog2_application_secret = 'changeme',
) inherits roles::base {

  include ::mongodb

  class { 'graylog2::repo':
    version => '1.3'
  } ->
  class { 'graylog2::server':
    password_secret                                    => $graylog2_password_secret,
    root_password_sha2                                 => $graylog2_root_password_sha2,
    elasticsearch_discovery_zen_ping_multicast_enabled => false,
    elasticsearch_discovery_zen_ping_unicast_hosts     => 'es1.leebriggs.lan:9300',
    elasticsearch_shards                               => '2',
    elasticsearch_replicas                             => '1',
  } ->
  class { 'graylog2::web':
    application_secret => $graylog2_application_secret,
  }
}
