# Set the module path to something sane
moduledir 'vendor'

# Good old stdlib
mod 'puppetlabs/stdlib', :latest

# Apache Module
mod 'puppetlabs/apache', '1.6.0'

# Graphite Module
mod 'dwerder/graphite', '5.14.0'

# Epel for all the things
mod 'stahnma/epel', :latest

# Grafana Module
mod 'bfraser/grafana', '2.1.0'

# Diamond stats collector
# Using this fork because the official mod has no systemd support
mod 'diamond',
  :git => 'https://github.com/justin8/garethr-diamond.git',
  :ref => 'ubuntu15-and-systemd-support'

# SystemD helper module
mod 'justin8/systemd', '0.3.0'
