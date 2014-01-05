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

      # begin

        require "allotment/providers/#{provider.name}"
        klass = Object.const_get("Allotment::Providers::#{provider.name[0].upcase}#{provider.name[1..-1]}")
        provider_data = klass.new provider, logger
        message = Allotment::MessageBuilder.new provider_data

        puts message.terminal_output

        logger.info "#{humanise provider.name} Successful retrieval. #{provider_data.days_left} days left (#{provider_data.percentage_time_passed}% has gone by) until shiftover (#{provider_data.shiftover_date})"
        logger.info "Peak: #{provider_data.used_peak_data}GB (#{provider_data.percentage_peak_data}%) of #{provider_data.available_peak_data}GB / Offpeak: #{provider_data.used_offpeak_data}GB (#{provider_data.percentage_offpeak_data}%) of #{provider_data.available_offpeak_data}GB"


      # rescue StandardError => e
      #   logger.error "Something went wrong. Couldnt get stats for #{provider.name}"
      # end

    end

  end

end