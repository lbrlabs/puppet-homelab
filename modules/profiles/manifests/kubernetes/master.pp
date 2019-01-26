# Kubernetes master
class profiles::kubernetes::master {


  ::consul::service { 'k8s':
    ensure => present,
    port   => 6443,
    tags   => ['kube'],
  }

  ::consul::check { 'kubernetes_healthcheck':
    ensure     => present,
    interval   => '15s',
    args       => ['/usr/lib/nagios/plugins/check_http', '-H localhost', '-u https://localhost:6443/healthz', '-p 6443', '-s ok', '-S' ],
    notes      => 'Check kubernetes API service',
    service_id => 'k8s',
  }

}
