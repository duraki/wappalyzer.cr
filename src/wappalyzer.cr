require "logger"
require "./*"

module Wappalyzer
  class Log
    def initialize
      @log = Logger.new(STDOUT)
    end

    def log
      @log
    end
  end
end
