# A role to manage a puppetmaster
class roles::puppetmaster inherits roles::base {

  #include puppet::master

  include ::foreman_proxy

  ::consul::service { 'puppetmaster':
    port => '8140',
    tags => ['puppet'],
  }

  ::consul::check { 'puppetmaster_tcp':
    interval   => '60',
    tcp        => 'localhost:8140',
    notes      => 'Puppetmasters listen on port 8140',
    service_id => 'puppetmaster',
  }

}
