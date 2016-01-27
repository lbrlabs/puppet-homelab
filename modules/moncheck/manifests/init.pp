# A monitoring check defined type
define moncheck (
  $command,
  $event_description,
  $interval = 60,
  $occurrences = 1,
  $ensure = 'present',
  $handlers = ['opsgenie'],
  $subscribers = [],
  $aggregate = false,
  $handle = undef,
  $standalone = true,
  $sensu_custom = undef,
) {

  ::sensu::check { $name:
    ensure      => $ensure,
    handlers    => $handlers,
    command     => $command,
    standalone  => $standalone,
    interval    => $interval,
    occurrences => $occurrences,
    aggregate   => $aggregate,
    subscribers => $subscribers,
    handle      => $handle,
    custom      => merge ({
      event_description => $event_description,
    }, $sensu_custom)
  }

}
