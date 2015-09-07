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

  # /etc/puppet/manifests/site.pp
  file{ '/etc/mcollective/facts.yaml':
    owner    => root,
    group    => root,
    mode     => '0400',
    loglevel => debug, # reduce noise in Puppet reports
    content  => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime_seconds|timestamp|free)/ }.to_yaml %>'), # exclude rapidly changing facts
  }

}
