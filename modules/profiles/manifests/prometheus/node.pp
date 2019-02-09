class profiles::prometheus::node {
  class { 'prometheus::node_exporter':}
  ::consul::service {'prometheus-node':
    tags =>  ["role_${::role}"],
  }
}
