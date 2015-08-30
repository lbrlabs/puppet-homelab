# Web server role
class roles::web inherits roles::base {

  include ::jira

  include ::apache

  apache::vhost { 'grafana.leebriggs.lan':
    serveraliases => [
      'grafana.leebriggs.io',
      'grafana.leebriggs.co.uk',
    ],
    port          => '80',
    docroot       => '/var/www/grafana',
    proxy_dest    => 'http://graphite.leebriggs.lan:3000',
  }

  apache::vhost { 'jira.leebriggs.lan':
    serveraliases       => [
      'jira.briggs.io',
      'jira.leebriggs.co.uk',
    ],
    port                => '80',
    docroot             => '/var/www/jira',
    proxy_dest          => 'http://localhost:8080',
    proxy_preserve_host => true
  }

  include ::apache::mod::status

  diamond::collector { 'HttpdCollector': }
}
