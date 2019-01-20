# Heavily inspired by sensu-puppet
source ENV['GEM_SOURCE'] || "https://rubygems.org"

# pin rspec for older puppet versions
if RUBY_VERSION >= '1.8.7' and RUBY_VERSION < '1.9'
    gem 'rspec', '~> 2.0'
end

group :development, :unit_tests do
  gem 'rake',                                             :require => false
  gem 'rspec-puppet',                                     :require => false
  gem 'puppetlabs_spec_helper',                           :require => false
  gem 'puppet-lint', "1.0.1",                             :require => false
  gem 'json',                                             :require => false
  gem 'puppet-syntax',                                    :require => false
  gem 'metadata-json-lint',                               :require => false
  gem 'puppet-blacksmith',                                :require => false
  gem 'rest-client', "1.6.8",                             :require => false
end

group :development do
  gem 'simplecov',   :require => false
  gem 'guard-rake',  :require => false
end

if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', '>= 5.0.0', '< 7.0.0', :require => false
end

# vim:ft=ruby
