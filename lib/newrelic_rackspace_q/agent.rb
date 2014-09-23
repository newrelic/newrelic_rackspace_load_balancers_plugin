require 'newrelic_rackspace_plugin/agent_plugin'
require 'newrelic_rackspace_q/version'

require 'json'

module NewRelicRackspacePlugin
  class PluginAgent
    module Q
      class Agent < PluginAgent

        agent_version NewRelicRackspacePlugin::Q::VERSION.version
        agent_guid 'com.newrelic.rackspace.q_overview'
        agent_human_labels('Rackspace Q'){ 'Rackspace Queues' }

        def poll_cycle
          log_errors do
            list_queues_hash = JSON.parse(fog(:queues).list_queues.body)

            list_queues_hash['queues'].each do |q|
              q.each do |k_queue, v_queue|
                log.warn "Fetching stats information for queue: #{v_queue}"

                if k_queue == "name"
                  get_queue_stats_hash = JSON.parse(fog(:queues).get_queue_stats(v_queue).body)

                  get_queue_stats_hash['messages'].each do |k_stats, v_stats|
                    #all, claimed, free
                    report_metric k_stats, 'messages', v_stats, :name => v_queue
                  end    
                end
              end
            end
          end
        end
      end
    end
  end
end

NewRelic::Plugin::Setup.install_agent :rackspace_q, NewRelicRackspacePlugin::PluginAgent::Q
