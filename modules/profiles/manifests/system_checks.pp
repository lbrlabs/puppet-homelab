# Some base system checks
class profiles::system_checks {

  # TODO: is this the best place for this?
  package { 'nagios-plugins-all':
    ensure => installed,
  }

  moncheck { 'check_disk_usage':
    command           => '/usr/lib64/nagios/plugins/check_disk -u GB -l',
    event_description => 'Check the free disk space on this host!'
  }

  moncheck { 'check_load':
    command           => '/usr/lib64/nagios/plugins/check_load -r -w 5,5,5 -c 10,10,10',
    event_description => 'check the load on this host!'
  }
}
