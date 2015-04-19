module Mixpanel
  class ConfigManager
    class << self
      attr_writer :disable_on_simulator
      def disable_on_simulator?
        if @disable_on_simulator.nil?
          false
        else
          @disable_on_simulator
        end
      end

      def should_track?
        if Device.simulator? && disable_on_simulator?
          puts 'Blocked Mixpanel call'
          false
        else
          true
        end
      end
    end
  end
end
