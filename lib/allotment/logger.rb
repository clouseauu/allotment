class Logger
  def notify level, message
    puts "message"
    send(level, message)
  end
end