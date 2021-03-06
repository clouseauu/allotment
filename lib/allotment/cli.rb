require "allotment"

module Allotment

  module CLI

    def run
      o = options
      raise ArgumentError.new('Missing username and/or password') if (o.username.nil? || o.password.nil?)
      log = o.logfile ? Logger.new(o.logfile) : Logger.new(STDOUT)
      log.level = Logger::INFO
      p = Allotment::Processor.new(provider: o, logger: log)
      p.show_usage
    end

    def options
      Trollop::options do
        opt :name,      "Provider", type: :string, :short => "-n", default: "fuzeconnect"
        opt :logfile,   "Log File", type: :string, default: "#{File.expand_path(File.join(ENV['HOME'], 'allotment.log'))}"
        opt :username,  "Username", type: :string
        opt :password,  "Password", type: :string
        opt :puser,     "Pushover User Token", type: :string, :short => "-t"
        opt :papp,      "Pushover App Token", type: :string, :short => "-a"
      end
    end

    module_function :run, :options

  end

end