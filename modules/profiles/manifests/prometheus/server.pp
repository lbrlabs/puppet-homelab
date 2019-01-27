# prometheus server profile
class profiles::prometheus::server {

  class { 'prometheus::server':
    version        => '2.6.1',
    scrape_configs => [
      {
        'job_name'        => 'prometheus',
        'scrape_interval' => '10s',
        'scrape_timeout'  => '10s',
        'static_configs'  =>
        [
          { 'targets' => [ 'localhost:9090' ],
            'labels'  => { 'alias' => 'Prometheus'}
          }
        ]
      }
    ]
  }


}
