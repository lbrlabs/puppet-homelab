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
      },
      {
        'job_name'        => 'federate',
        'scrape_interval' => '15s',
        'scrape_timeout'  => '10s',
        'honor_labels'    => true,
        'metrics_path'    => '/federate',
        'params'          => {
          'match[]' => [
            '{job!=""}'
          ],
        },
        'static_configs'  => 
        [
          { 'targets' => [ 'prom-k8s.home.lbrlabs.com' ],
            'labels'  => { 'alias' => 'k8s'}
          }
        ]
      }
    ]
  }


}
