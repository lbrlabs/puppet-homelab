# Sets up a dnsmasq dns and dhcp server
class roles::dns inherits roles::base {

  include ::dnsmasq


  # Adding DHCP options
  dnsmasq::dhcp { 'dhcp':
    dhcp_start => '192.168.4.101',
    dhcp_end   => '192.168.4.199',
    netmask    => '255.255.255.0',
    lease_time => '24h'
  }

  dnsmasq::dhcpoption { 'gateway':
    content => '192.168.4.1',
    option  => 'option:router'
  }

  dnsmasq::dhcpoption { 'domainname':
    content => 'leebriggs.lan',
    option  => 'option:domain-name'
  }

  dnsmasq::dhcpoption { 'dnsserver':
    content => '192.168.4.23',
    option  => 'option:dns-server'
  }
  
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

  dnsmasq::cname { 'grafana,grafana.leebriggs.lan':
    host => 'web',
  }

  dnsmasq::cname { 'jira,jira.leebriggs.lan':
    host => 'web',
  }

  dnsmasq::cname { 'uchiwa,uchiwa.leebriggs.lan':
    host => 'web',
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
