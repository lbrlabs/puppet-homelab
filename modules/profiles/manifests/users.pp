# manage and install users
class profiles::users (
  $groups = [ 'admin' ] 
){

  group { 'admin':
    gid => 2000,
  }

  group { 'docker':
  }

  accounts::user { 'lbriggs':
    shell   => '/bin/bash',
    comment => 'Lee Briggs',
    groups  => $groups,
    uid     => '1000',
    gid     => '1000',
    sshkeys => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhI2N7owvPzsjZqgzxmNBfAfJ1/oZQG17+p6CIyUNtov+L58Cq03AwyG9yeW7JVsj5Fm85ALosMO32yRh6XM/9VHnomMw9n1fX/ZbQLM+rXp1y9O03RK+YGA1tlYWhQKjdUJw3VTT+60PG5aOiSC4GkLZG1ip6N0wOufhKOQ6nAR156WFDlc2oxBc6PXlm9uj4STpFVT91f0T9VeDh273+iA2KRo9GMzpiaD+3z6aIBGJawxzhMxTIedPYNHAQlBESc+8H4RqAEPt2x7yQWs0loqOWLpxwGEpXPanuA1MXfk5xxUOAsRTyEOrpNYCky6xWgFHHEsj3frcJZAfHQh3B lbriggs-on-lbriggs',
    ],
  }
}
