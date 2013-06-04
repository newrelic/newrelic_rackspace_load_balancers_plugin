# Rackspace load balancer plugin

## Dependencies
* Ruby
* New Relic Rackspace plugin `gem install newrelic_rackspace_plugin`
* Bundler `gem install bundler`

## Usage
1. Create a Gemfile within desired directory
2. Add entry for any rackspace plugin to include
3. Run `bundle install --binstubs`
4. Run `./bin/newrelic_rs --sample-config`
5. Edit `config/newrelic_plugin.yml`
6. Run `./bin/newrelic_rs`
