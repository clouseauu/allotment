require "logger"

module Allotment

  class Processor

    def initialize options = {}
      @provider = options[:provider]
      @logger = options[:logger] || Logger.new(STDOUT)
    end

    def show_usage
      process_quota
    end

    private

    attr_reader :provider, :logger

    def process_quota

      begin

        require "allotment/providers/#{provider.name}"
        klass = Object.const_get("Allotment::Providers::#{humanise provider.name}")
        provider_data = klass.new provider, logger

        puts "Usage statistics for #{humanise provider.name}."
        puts "Shiftover date: #{provider_data.shiftover_date}. #{provider_data.days_left} days left (#{provider_data.percentage_time_passed}% has passed)"
        puts "Peak data: #{provider_data.used_peak_data}GB (#{provider_data.percentage_peak_data}%) of #{provider_data.available_peak_data}GB"
        puts "Offpeak data: #{provider_data.used_offpeak_data}GB (#{provider_data.percentage_offpeak_data}%) of #{provider_data.available_offpeak_data}GB"
        logger.info "#{humanise provider.name} Successful retrieval. #{provider_data.days_left} days left (#{provider_data.percentage_time_passed}% has gone by) until shiftover (#{provider_data.shiftover_date})"
        logger.info "Peak: #{provider_data.used_peak_data}GB (#{provider_data.percentage_peak_data}%) of #{provider_data.available_peak_data}GB / Offpeak: #{provider_data.used_offpeak_data}GB (#{provider_data.percentage_offpeak_data}%) of #{provider_data.available_offpeak_data}GB"


      rescue StandardError => e
        logger.error "Something went wrong. Couldnt get stats for #{humanise provider}"
      end

    end

    def humanise str
      "#{str[0].upcase}#{str[1..-1]}"
    end

  end

end