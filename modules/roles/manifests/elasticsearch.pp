# Adding an elasticsearch role
class roles::logs inherits roles::base {

  include ::elasticsearch

  ::elasticsearch::instance { 'graylog2':
    config => { 
      'node.name'                            => $::fqdn,
      'discovery.zen.ping.multicast.enabled' => 'false',
      'discovery.zen.ping.unicast.hosts'     => 'es1.leebriggs.lan:9300',
      'cluster.name'                         => 'graylog2',
      'bootstrap.mlockall'                   => 'true',
    },
    init_defaults => { 
      'MAX_OPEN_FILES' => '65535',
    }, 
  }

}
