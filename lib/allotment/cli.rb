require "trollop"
require "awesome_print"

module Allotment

  module CLI

    module_function :run, :options

    def run
      ap options
    end

    def options
      Trollop::options do
        opt :provider, "Provider", type: :string, default: "fuzeconnect"
        opt :username, "Username", type: :string
        opt :password, "Password", type: :string
      end
    end


  end

end