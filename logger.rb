class Logger

  DEBUG = 1
  INFO = 2
  ERROR = 3

  def initialize(caller, filter = 0, filename = 'log')
    @caller = caller
    @filter = filter
    @filename = filename
  end

  def log(level, msg, print_to_file)
    output = "[#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}] #{level} #{@caller}: #{msg}\n"
    if print_to_file
      file = File.open(@filename, "a")
      file.write(output)
      file.close
    end

    puts output

  end

  def debug(msg)
    print_to_file = @filter <= DEBUG
    log("DEBUG", msg, print_to_file)
  end

  def info(msg)
    print_to_file = @filter <= INFO
    log("INFO", msg, print_to_file)
  end

  def error(msg)
    print_to_file = @filter <= ERROR
    log("ERROR", msg, print_to_file)
  end


end

l = Logger.new("test", Logger::INFO )
l.error("Hello World!")
l.info("Information here")
l.debug("Debugging here")