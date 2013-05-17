require 'newrelic_rackspace_plugin/agent_plugin'
require 'newrelic_rackspace_lb/version'

module NewRelicRackspacePlugin
  class PluginAgent
    module Lb
      class Agent < PluginAgent

        agent_version NewRelicRackspacePlugin::Lb::VERSION.version
        agent_guid 'com.newrelic.rackspace.lb_overview'
        agent_human_labels('Rackspace LB'){ 'Rackspace LB Overview' }

        STATS = [
          {:key => 'incoming', :ref => 'incomingTransfer', :unit => 'bytes'},
          {:key => 'incoming_ssl', :ref => 'incomingTransferSsl', :unit => 'bytes'},
          {:key => 'outgoing', :ref => 'outgoingTransfer', :unit => 'bytes'},
          {:key => 'outgoing_ssl', :ref => 'outgoingTransferSsl', :unit => 'bytes'}
        ]
        
        def poll_cycle
          fog(:loadbalancers).load_balancers.each do |lb|
            # TODO/NOTE: We can only use time block queries via fog.
            # Update to use /current once implemented
            usage = lb.usage(
              :start_time => Time.now.strftime('%Y-%m-%d'),
              :end_time => (Time.now + 86400).strftime('%Y-%m-%d')
            )
            stats = usage['loadBalancerUsageRecords'].last
            STATS.each do |get_stat|
              report_metric get_stat[:key], get_stat[:unit], stats[get_stat[:ref]], :name => lb.name
            end
          end
        end
      end
    end
  end
end

NewRelic::Plugin::Setup.install_agent :rackspace_lb, NewRelicRackspacePlugin::PluginAgent::Lb

