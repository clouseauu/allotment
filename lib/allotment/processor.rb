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
        klass = Object.const_get("Allotment::Providers::#{humanise provider.name}")
        provider_data = klass.new provider, logger

        puts "Usage statistics for #{humanise provider.name}."
        puts "Shiftover date: xxx. x days (y%) left"
        puts "Peak data: x GB (x%) of y"
        puts "Offpeak data: x GB (x%) of y"
        logger.info "Successful retrieval. x days (y%) left until shiftover"
        logger.info "Peak: x GB (x%) of y / Offpeak: x GB (x%) of y"


      # rescue StandardError => e
      #   logger.error "Something went wrong. Couldnt get stats for #{humanise provider}"
      # end

    end

    def humanise str
      "#{str[0].upcase}#{str[1..-1]}"
    end

  end

end