module Allotment

  module Providers

    class Fuzeconnect < Provider

      def process
        ap "fuze connect"
        login
        visit_data_page
      end

      def shiftover_date
        "jujaju"
      end

      def days_left
        "sarasa"
      end

      def percentage_time_left
        "jujaju"
      end

      def available_peak_data
        "sarasa"
      end

      def used_peak_data
        "jujaju"
      end

      def percentage_peak_data
        "sarasa"
      end

      def available_offpeak_data
        "jujaju"
      end

      def used_offpeak_data
        "sarasa"
      end

      def percentage_offpeak_data
        "jujaju"
      end


      private

      def login; end
      def visit_data_page; end

    end

  end

end