# A hardware profile for setting up
# physical servers
class profiles::hardware {

  #diamond::collector { 'DiskUsageCollector': }

  diamond::collector { 'VZBCCollector':
    name  => 'vzbc',
    options => [
      'method=Threaded',
    ],
  }

}
