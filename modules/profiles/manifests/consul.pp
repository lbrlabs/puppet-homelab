# consul profiles
class profiles::consul (
  $datacenter = 'home',
  $advertise_addr = "${::networking.interfaces.eth0.ip}",
  $retry_join = [],
  $server = false,
  $bootstrap_expect = 3,
  $ui = false,
){


  $common_config = {
    datacenter           => $datacenter,
    data_dir             => '/opt/consul',
    advertise_addr       => $advertise_addr,
    client_addr          => '0.0.0.0',
    node_name            => $::fqdn,
    retry_join           => $retry_join,
    #ca_file              => "${::puppet_sslpaths['certdir']['path']}/ca.pem",
    #cert_file            => "${::puppet_sslpaths['certdir']['path']}/${::fqdn}.pem",
    #key_file             => "${::puppet_sslpaths['privatekeydir']['path']}/${::fqdn}.pem",
    server               => $server,
  }

  $server_hash = {
    bootstrap_expect => $bootstrap_expect,
    ui               => $ui,
  }

  if $server {
    $config_hash = merge($common_config, $server_hash)
  } else {
    $config_hash = $common_config
  }


  class { '::consul':
    config_hash   => $config_hash,
    pretty_config => true,
  }


}
