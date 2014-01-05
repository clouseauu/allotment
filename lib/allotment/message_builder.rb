module Allotment

  class MessageBuilder

    attr_reader :data

    def initialize data
      @data = data
    end

    def terminal_output
      msg =  "Usage statistics for #{humanise data.name}.\n"
      msg << "Shiftover date: #{data.shiftover_date}. #{data.days_left} days left (#{data.percentage_time_passed}% has passed)\n"
      msg << "Peak data: #{data.used_peak_data}GB (#{data.percentage_peak_data}%) of #{data.available_peak_data}GB\n"
      msg << "Offpeak data: #{data.used_offpeak_data}GB (#{data.percentage_offpeak_data}%) of #{data.available_offpeak_data}GB\n\n"

      msg << "#{progress_bar(data.percentage_time_passed, 'Time passed')}\n"
      msg << "#{progress_bar(data.percentage_peak_data, 'Peak data')}\n"
      msg << "#{progress_bar(data.percentage_offpeak_data, 'Off-peak data')}\n\n"
    end

    def logger_output
    end

    def pushover_output
    end

    private

    def humanise str
      "#{str[0].upcase}#{str[1..-1]}"
    end

    def progress_bar percentage, label
      used = (percentage/2).ceil
      empty = 50 - used
      "[#{'='*used}#{'.'*empty}] #{label}"
    end

  end

end