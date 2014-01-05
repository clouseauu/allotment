require "logger"

module Allotment

  class Processor

    def initialize options = {}
      @provider = options[:provider]
      @logger = options[:logger] || Logger.new(STDOUT)
      @send_pushover = (!@provider.puser.nil? && !@provider.papp.nil?)
    end

    def show_usage
      process_quota
    end

    private

    attr_reader :provider, :logger, :send_pushover

    def process_quota

      begin

        require "allotment/providers/#{provider.name}"
        klass = Object.const_get("Allotment::Providers::#{provider.name[0].upcase}#{provider.name[1..-1]}")
        provider_data = klass.new provider, logger
        message = Allotment::MessageBuilder.new provider_data

        puts message.terminal_output
        logger.info message.logger_output
        Pushover.notification(message: message.pushover_output, title: "#{provider.name} data usage", user: provider.puser, token: provider.papp) if send_pushover

      rescue StandardError => e
        logger.error "Something went wrong. Couldnt get stats for #{provider.name}"
      end

    end

  end

end