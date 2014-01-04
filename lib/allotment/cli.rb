require "allotment"

module Allotment

  module CLI

    def run
      ap options
      log = options.logfile ? Logger.new(options.logfile) : Logger.new(STDOUT)
      log.level = Logger::INFO
      p = Allotment::Processor.new(provider: options.provider, logger: log)
      p.show_usage
    end

    def options
      Trollop::options do
        opt :provider, "Provider", type: :string, default: "fuzeconnect"
        opt :logfile, "Log File", type: :string
        opt :username, "Username", type: :string
        opt :password, "Password", type: :string
      end
    end

    module_function :run, :options

  end

end