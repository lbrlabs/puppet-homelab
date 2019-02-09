class profiles::nfs (
  $server = false,
  $export_path = '/export',
){

  file { $export_path :
    ensure => directory,
  } ->

  class { '::nfs':
    server_enabled => $server,
    client_enabled => true,
  }

  if $server {
    nfs::server::export { $export_path:
      ensure  => 'mounted',
      clients => '192.168.1.0/24(rw,insecure,async,no_root_squash) localhost(rw)',
    }
  }
}
