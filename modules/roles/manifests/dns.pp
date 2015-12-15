# Sets up a dnsmasq dns and dhcp server
class roles::dns inherits roles::base {

  include ::dnsmasq


  # Start DNS records
  dnsmasq::hostrecord { 'gateway,gateway.leebriggs.lan':
    ip  => '192.168.4.1',
  }

  dnsmasq::hostrecord { 'virt1,virt1.leebriggs.lan':
    ip  => '192.168.4.7',
  }

  dnsmasq::hostrecord { 'virt2,virt2.leebriggs.lan':
    ip  => '192.168.4.5',
  }

  dnsmasq::hostrecord { 'virt3,virt3.leebriggs.lan':
    ip  => '192.168.4.6',
  }

  dnsmasq::hostrecord { 'web,web.leebriggs.lan':
    ip  => '192.168.4.34',
  }

  dnsmasq::hostrecord { 'graphite,graphite.leebriggs.lan':
    ip  => '192.168.4.24',
  }


  dnsmasq::hostrecord { 'dns1,dns1.leebriggs.lan':
    ip  => '192.168.4.23',
  }

  dnsmasq::hostrecord { 'puppetmaster,puppetmaster.leebriggs.lan':
    ip  => '192.168.4.20',
  }
  
  dnsmasq::hostrecord { 'packages,packages.leebriggs.lan':
    ip  => '192.168.4.26',
  }

  dnsmasq::hostrecord { 'sensu,sensu.leebriggs.lan':
    ip  => '192.168.4.29',
  }
  
  dnsmasq::hostrecord { 'db,db.leebriggs.lan':
    ip  => '192.168.4.30',
  }
  
  dnsmasq::hostrecord { 'foreman,foreman.leebriggs.lan':
    ip  => '192.168.4.31',
  }

  dnsmasq::hostrecord { 'git,git.leebriggs.lan':
    ip  => '192.168.4.40',
  }

  dnsmasq::cname { 'grafana,grafana.leebriggs.lan':
    hostname => 'web',
  }

  dnsmasq::cname { 'jira,jira.leebriggs.lan':
    hostname => 'web',
  }

  dnsmasq::cname { 'uchiwa,uchiwa.leebriggs.lan':
    hostname => 'web',
  }

  # Reservations

  dnsmasq::dhcpstatic { 'media':
    mac => 'C8:9C:DC:2A:6A:7D',
    ip  => '192.168.4.101',
  }

  dnsmasq::dhcpstatic { 'printer':
    mac => 'B0:E8:92:49:17:64',
    ip  => '192.168.4.190',
  }

  dnsmasq::dhcpstatic { 'macbook-lan':
    mac => '00:E0:81:00:14:EB',
    ip  => '192.168.4.102',
  }

  # Final options
  dnsmasq::dnsserver { 'dns':
    ip => '8.8.8.8',
  }

}
