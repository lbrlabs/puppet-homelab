# MCollective + plugins
class profiles::mcollective {

  include ::mcollective

  mcollective::plugin { 'puppet':
      package => true,
  }

  mcollective::plugin {'facter-facts':
    package => true,
  }

  mcollective::plugin {'service':
    package => true,
  }

  mcollective::plugin {'package':
    package => true,
  }

}
