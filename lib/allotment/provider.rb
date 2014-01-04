module Allotment

  module Providers

    class Provider

      attr_reader :name, :logger

      def initialize name
        @name = name
        @logger = logger
        process
      end

      def process
        raise NoMethodError.new "Method not implemented"
      end

      def shiftover_date
        raise NoMethodError.new "Method not implemented"
      end

      def days_left
        raise NoMethodError.new "Method not implemented"
      end

      def percentage_time_left
        raise NoMethodError.new "Method not implemented"
      end

      def available_peak_data
        raise NoMethodError.new "Method not implemented"
      end

      def used_peak_data
        raise NoMethodError.new "Method not implemented"
      end

      def percentage_peak_data
        raise NoMethodError.new "Method not implemented"
      end

      def available_offpeak_data
        raise NoMethodError.new "Method not implemented"
      end

      def used_offpeak_data
        raise NoMethodError.new "Method not implemented"
      end

      def percentage_offpeak_data
        raise NoMethodError.new "Method not implemented"
      end

    end

  end

end