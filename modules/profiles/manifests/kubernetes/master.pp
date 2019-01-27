# Kubernetes master
class profiles::kubernetes::master {


  ::consul::service { 'k8s':
    ensure => present,
    port   => 6443,
    tags   => ['kube'],
  }

}
