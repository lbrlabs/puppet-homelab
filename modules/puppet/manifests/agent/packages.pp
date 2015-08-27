# Installs the required packages for a Puppet agent
class puppet::agent::packages (
  # version is the puppet agent version we should install
  $version    = 'installed',
  $facter_version    = 'installed',
) {
  package { 'puppet':
    ensure => $version,
  }

  package { 'facter':
    ensure => $facter_version,
  }
}
