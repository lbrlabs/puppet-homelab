require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'
require 'metadata-json-lint/rake_task'

begin
  require 'puppet_blacksmith/rake_tasks'
rescue
end

exclude_paths = [
  "pkg/**/*",
  "vendor/**/*",
  "spec/**/*",
  "vendor/**/*",
]

PuppetLint.configuration.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
PuppetLint.configuration.pattern = "modules/*/*/*.pp"
PuppetLint.configuration.with_filename = true
PuppetLint.configuration.ignore_paths = exclude_paths
PuppetLint.configuration.send("disable_80chars")
PuppetSyntax.exclude_paths = exclude_paths
PuppetSyntax.hieradata_paths = ["hieradata/*.yaml"]

desc "Run syntax, lint, and spec tests."
task :test => [
  :syntax,
  :lint,
]
