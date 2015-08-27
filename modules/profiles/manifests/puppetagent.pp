# Install the Puppet agent and related things
class profiles::puppetagent {

  # Include the Puppet agent
  include puppet::agent

  # Include the diamond collector with it
  diamond::collector { 'PuppetAgentCollector': }

}
