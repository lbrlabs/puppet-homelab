# Kubernetes master
class profiles::kubernetes::master {


  ::consul::service { 'k8s':
    ensure => present,
    port   => 6443,
    tags   => ['kube'],
  }

  /*
  ::consul::check { 'kubernetes_healthcheck':
    ensure          => present,
    interval        => '15s',
    http            => 'https://localhost:6443/healthz',
    method          => 'GET',
    tls_skip_verify => true,
    notes           => 'Check kubernetes API service',
    service_id      => 'k8s',
  }
  */

}
