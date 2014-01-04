require "logger"

module Allotment

  class Processor

    def initialize options = {}
      @provider = options[:provider] || 'fuzeconnect'
      @logger = options[:logger] || Logger.new(STDOUT)
    end

    def usage
      process_quota
    end

    private

    attr_reader :provider, :logger, :humanized_provider

    def process_quota

      begin

        require_relative "./providers/#{provider}"
        klass = Object.const_get("::Providers::#{humanise provider}")
        provider_data = klass.new

        logger.info "Usage statistics for #{humanise provider}."
        logger.info "Shiftover date: xxx. x days (y%) left"
        logger.info "Peak data: x GB (x%) of y"
        logger.info "Offpeak data: x GB (x%) of y"

      rescue StandardError => e
        logger.error "Something went wrong. Couldnt download #{vid}"
      end

    end

    def humanise str
      @humanized_provider ||= "#{str[0].upcase}#{str[1..-1]}"
    end

  end

end