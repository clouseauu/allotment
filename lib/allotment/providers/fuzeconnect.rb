module Allotment

  module Providers

    class Fuzeconnect < Provider

      SITE_URL = "http://www.fuzeconnect.com.au"
      USAGE_PAGE = "myaccount/usage.php"

      def process
        login
      end

      def shiftover_date
        next_month.strftime "%d %b, %Y"
      end

      def days_left
        (next_month - Date.today).to_i
      end

      def percentage_time_passed
        ( ( 100.0 / (next_month - date_object).to_i ) * ( Date.today - date_object ).to_i ).round 2
      end

      def available_peak_data
        peak_regex[3].to_f
      end

      def used_peak_data
        peak_regex[1].to_f
      end

      def percentage_peak_data
        ( ( 100.0 / available_peak_data ) * used_peak_data ).round 2
      end

      def available_offpeak_data
        offpeak_regex[3].to_f
      end

      def used_offpeak_data
        offpeak_regex[1].to_f
      end

      def percentage_offpeak_data
        ( ( 100.0 / available_offpeak_data ) * used_offpeak_data ).round 2
      end

      private

      attr_reader :provider, :logger, :humanized_provider, :logged_in

      def offpeak_regex
        usage_summary.match(/Total Off-peak Usage: ([0-9\.]+) GB(\s+)from a total ([0-9\.]+) GB/)
      end

      def peak_regex
        usage_summary.match(/Total Peak Usage: ([0-9\.]+) GB(\s+)from a total ([0-9\.]+) GB/)
      end

      def next_month
        date_object >> 1
      end

      def date_object
        @date_object ||= Date.parse(date_text)
      end

      def date_text
        usage_summary.match(/Anniversary Date: (\d{4}-\d{2}-\d{2})/)[1]
      end

      def usage_summary
        @usage_summary ||= data_page.search("#UsageSummary").first.content.gsub("\r\n", "")
      end

      def data_page
        login unless @data_page
        @data_page
      end

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