# A profile that installs a bunch of packages 
# that I need everywhere and require no config
class profiles::packages {

  case $::operatingsystem {
    'Centos','Scientific': {
      case $::operatingsystemmajrelease {
        '5','6','7': {
          package {[
            'perl-DateTime-Format-DateParse',
            'perl-Config-Simple',
            'perl-WWW-Curl',
            'screen',
            'mosh',
            'git',
            'telnet',
            'numactl',
            'pwgen',
            'ack',
            'bind-utils',
            'tmux',
            'gcc-c++',
            'vim-enhanced',
            ]:
            ensure => installed
          }
        }
      default: { fail('Operating System Not Supported') }
      }
    }
  }
}
