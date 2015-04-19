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

      attr_writer :disable_in_development
      def disable_in_development?
        if @disable_in_development.nil?
          false
        else
          @disable_in_development
        end
      end

      attr_writer :disable_in_test
      def disable_in_test?
        if @disable_in_test.nil?
          true
        else
          @disable_in_test
        end
      end

      def should_track?
        return false if Device.simulator? && disable_on_simulator?
        return false if App.development? && disable_in_development?
        return false if App.test? && disable_in_test?
        true
      end
    end
  end
end
