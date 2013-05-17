$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__)) + '/lib/'
require 'newrelic_rackspace_lb/version'
Gem::Specification.new do |s|
  s.name = 'newrelic_rackspace_load_balancers_plugin'
  s.version = NewRelicRackspacePlugin::Lb::VERSION.version
  s.summary = 'Rackspace LB'
  s.author = 'New Relic'
  s.description = 'Rackspace LB'
  s.require_path = 'lib'
  s.add_dependency 'newrelic_rackspace_plugin'
  s.executables << 'newrelic_rackspace_lb'
  s.files = Dir['**/*']
end
