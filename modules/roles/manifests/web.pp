# Web server role
class roles::web inherits roles::base {

  include ::jira

  include ::apache

  apache::vhost { 'grafana.leebriggs.lan':
    port       => '80',
    docroot    => '/var/www/grafana',
    proxy_dest => 'http://graphite.leebriggs.lan:3000',
  }

}
