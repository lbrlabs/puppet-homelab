# Web server role
class roles::web inherits roles::base {

  include ::jira
  include ::apache

  apache::vhost { 'grafana.briggs.io':
    serveraliases => [
      'grafana.leebriggs.lan',
      'grafana.leebriggs.co.uk',
    ],
    port          => '443',
    docroot       => '/var/www/grafana',
    proxy_dest    => 'http://graphite.leebriggs.lan:3000',
    ssl           => true,
    ssl_cert      => '/etc/ssl/star_briggs_io.cert',
    ssl_key       => '/etc/ssl/star_briggs_io.key',
  }

  apache::vhost { 'grafana.briggs.io plaintext':
    servername      => 'grafana.briggs.io',
    port            => 80,
    docroot         => '/var/www/grafana',
    redirect_status => 'permanent',
    redirect_dest   => 'https://grafana.briggs.io',
  }

  apache::vhost { 'jira.briggs.io':
    serveraliases       => [
      'jira.leebriggs.lan',
      'jira.leebriggs.co.uk',
    ],
    port                => '443',
    docroot             => '/var/www/jira',
    proxy_dest          => 'http://localhost:8080',
    proxy_preserve_host => true,
    ssl                 => true,
    ssl_cert            => '/etc/ssl/star_briggs_io.cert',
    ssl_key             => '/etc/ssl/star_briggs_io.key',
    ssl_proxyengine     => true,
  }

  apache::vhost { 'jira.briggs.io plaintext':
    servername      => 'jira.briggs.io',
    port            => 80,
    docroot         => '/var/www/jira',
    redirect_status => 'permanent',
    redirect_dest   => 'https://jira.briggs.io',
  }

  apache::vhost { 'movies.briggs.io':
    serveraliases       => [
      'movies.leebriggs.lan',
      'movies.leebriggs.co.uk',
    ],
    port                => '443',
    docroot             => '/var/www/movies',
    proxy_dest          => 'http://192.168.4.4:5050',
    proxy_preserve_host => true,
    ssl                 => true,
    ssl_cert            => '/etc/ssl/star_briggs_io.cert',
    ssl_key             => '/etc/ssl/star_briggs_io.key',
    ssl_proxyengine     => true,
  }

  apache::vhost { 'movies.briggs.io plaintext':
    servername      => 'movies.briggs.io',
    port            => 80,
    docroot         => '/var/www/movies',
    redirect_status => 'permanent',
    redirect_dest   => 'https://movies.briggs.io',
  }

  apache::vhost { 'tv.briggs.io':
    serveraliases       => [
      'tv.leebriggs.lan',
      'tv.leebriggs.co.uk',
    ],
    port                => '443',
    docroot             => '/var/www/tv',
    proxy_dest          => 'http://192.168.4.4:8081',
    proxy_preserve_host => true,
    ssl                 => true,
    ssl_cert            => '/etc/ssl/star_briggs_io.cert',
    ssl_key             => '/etc/ssl/star_briggs_io.key',
    ssl_proxyengine     => true,
  }

  apache::vhost { 'tv.briggs.io plaintext':
    servername      => 'tv.briggs.io',
    port            => 80,
    docroot         => '/var/www/tv',
    redirect_status => 'permanent',
    redirect_dest   => 'https://tv.briggs.io',
  }

  include ::apache::mod::status

  diamond::collector { 'HttpdCollector':
    options => {
      'urls' => "${::fqdn} http://localhost:8080/server-status?auto",
    },
  }
}
