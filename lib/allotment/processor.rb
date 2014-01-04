require "logger"

module Allotment

  class Processor

    def initialize options = {}
      @provider = options[:provider] || 'fuzeconnect'
      @logger = options[:logger] || Logger.new(STDOUT)
    end

    def show_usage
      process_quota
    end

    private

    attr_reader :provider, :logger, :humanized_provider

    def process_quota

      # begin

        require "allotment/providers/#{provider}"
        klass = Object.const_get("Allotment::Providers::#{humanise provider}")
        provider_data = klass.new provider, logger

        logger.notify 'info', "Usage statistics for #{humanise provider}."
        logger.notify 'info', "Shiftover date: xxx. x days (y%) left"
        logger.notify 'info', "Peak data: x GB (x%) of y"
        logger.notify 'info', "Offpeak data: x GB (x%) of y"

      # rescue StandardError => e
      #   logger.error "Something went wrong. Couldnt get stats for #{humanise provider}"
      # end

    end

    def humanise str
      @humanized_provider ||= "#{str[0].upcase}#{str[1..-1]}"
    end

  end

end