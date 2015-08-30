# A monitoring check defined type
define moncheck (
  $command,
  $event_description,
  $interval = 60,
  $occurrences = 1,
  $ensure = 'present',
  $handlers = ['opsgenie'],
  $sensu_custom = undef,
) {

  ::sensu::check { $name:
    ensure      => $ensure,
    handlers    => $handlers,
    command     => $command,
    standalone  => true,
    interval    => $interval,
    occurrences => $occurrences,
    custom      => merge ({
      event_description => $event_description,
    }, $sensu_custom)
  }

}
