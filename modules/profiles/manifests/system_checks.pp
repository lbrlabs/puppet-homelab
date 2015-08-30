# Some base system checks
class profiles::system_checks {

  # TODO: is this the best place for this?
  package { 'nagios-plugins-all':
    ensure => installed,
  }

  moncheck { 'disk_usage':
    command           => '/usr/lib64/nagios/plugins/check_disk -u GB -l',
    event_description => 'Check the free disk space on this host!'
  }

}
