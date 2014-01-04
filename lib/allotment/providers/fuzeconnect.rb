module Allotment

  module Providers

    class Fuzeconnect < Provider

      SITE_URL = "http://www.fuzeconnect.com.au"
      USAGE_PAGE = "myaccount/usage.php"

      def initialize provider, logger
        super provider, logger
        @logged_in = false
      end

      def process
        ap "fuze connect"
        login
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

      attr_reader :provider, :logger, :humanized_provider, :logged_in, :data_page

      def login
        agent.get("#{SITE_URL}/#{USAGE_PAGE}") do | page |
          @data_page = page.form_with(action: "/#{USAGE_PAGE}") do | form_object |
            form_object.uName = provider.username
            form_object.pword = provider.password
          end.submit
        end
      end

    end

  end

end