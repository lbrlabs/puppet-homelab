# A hardware profile for setting up
# physical servers
class profiles::hardware {

  #diamond::collector { 'DiskUsageCollector': }

  diamond::collector { 'VZBCCollector':
    options => {
      'method' => 'Threaded',
    },
  }

}
