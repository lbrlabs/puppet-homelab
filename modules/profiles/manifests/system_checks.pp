# Some base system checks
class profiles::system_checks {

  # TODO: is this the best place for this?
  package { 'nagios-plugins-all':
    ensure => installed,
  }

  package { 'sensu-plugins-memory-checks':
    ensure   => installed,
    provider => sensu_gem
  }

  package { 'sensu-plugins-cpu-checks':
    ensure   => installed,
    provider => sensu_gem
  }

  sensu_check::client { 'check_disk_usage':
    command       => '/usr/lib64/nagios/plugins/check_disk -u GB -l',
    event_summary => 'Check the free disk space on this host!'
  }

  sensu_check::client { 'check_load':
    command       => '/usr/lib64/nagios/plugins/check_load -r -w 5,5,5 -c 10,10,10',
    event_summary => 'check the load on this host!'
  }

  sensu_check::client { 'check_cpu':
    command       => '/opt/sensu/embedded/bin/check-cpu.rb',
    event_summary => 'CPU usage is too high!',
  }

  sensu_check::client { 'check_ram':
    command       => '/opt/sensu/embedded/bin/check-ram.rb',
    event_summary => 'The amount of free memory is too low!',
  }

}
