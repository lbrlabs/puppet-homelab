# Add yum repos to hosts
class profiles::yumrepos {

  include ::epel

  yumrepo { 'custom':
    ensure   => present,
    baseurl  => "http://packages.leebriggs.lan/${::operatingsystem}-EL${::operatingsystemmajrelease}-${::architecture}/RPMS.custom/",
    descr    => 'Custom internal repository',
    enabled  => true,
    gpgcheck => 0
  }

}
