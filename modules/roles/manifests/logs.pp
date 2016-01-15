# a logserver managed with graylog2
class roles::logs (
  $graylog2_password_secret = 'changeme',
  $graylog2_root_password_sha2 = 'changeme',
  $graylog2_application_secret = 'changeme',
)inherits roles::base {

  include ::mongodb
  include ::elasticsearch
  ::elasticsearch::instance { 'graylog2': 
    config => { 
      'node.name'                            => $::fqdn,
      'discovery.zen.ping.multicast.enabled' => 'false',
      'discovery.zen.ping.unicast.hosts'     => 'logs.leebriggs.lan:9300',
      'cluster.name'                         => 'graylog2',
      'bootstrap.mlockall'                   => 'true',
    },
    init_defaults => { 
      'MAX_OPEN_FILES' => '65535',
    },
  }

  ::elasticsearch::plugin{'mobz/elasticsearch-head':
    instances  => 'graylog2'
  }

  class { 'graylog2::repo':
    version => '1.3'
  } ->
  class { 'graylog2::server':
    password_secret                                       => $graylog2_password_secret,
    root_password_sha2                                    => $graylog2_root_password_sha2,
    elasticsearch_discovery_zen_ping_multicast_enabled    => false,
    elasticsearch_discovery_zen_ping_unicast_hosts        => '192.168.4.10:9300',
    elasticsearch_shards                                  => '1',
  } ->
  class { 'graylog2::web':
    application_secret => $graylog2_application_secret,
  }
}
