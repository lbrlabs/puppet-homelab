class profiles::coredns {

  include ::coredns

  coredns::plugin { 'consul_forward':
    content => template('profiles/coredns/consul_forward.erb'),
  }


}
