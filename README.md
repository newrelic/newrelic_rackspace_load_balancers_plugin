# Rackspace Load Balancers plugin

## Dependencies
* Ruby (>= 1.8.7)
* Rubygems (>= 1.3.7)
* Bundler `gem install bundler`

## Usage
1. Download the latest tagged version from [HERE](https://github.com/newrelic-platform/newrelic_rackspace_load_balancers_plugin/tags)
2. Extract to the location you want to run the plugin from
3. Run `bundle install --binstubs`
4. Run `./bin/newrelic_rs --sample-config`
5. Edit `config/newrelic_plugin.yml`
6. Run `./bin/newrelic_rs`

## Notes
- Can use services like Upstart, Systemd, Runit, and Monit to manage the process.
