require "string_scanner"

module Wappalyzer
  extend self

  class Match
    getter :scripts

    def initialize
      @scripts = [] of String
      @logger = Wappalyzer::Log.new
    end

    def get_scripts(data : String) : Array(String)
      scripts = [] of String

      if m = data.match(/<script[^>]+src=("|')([^"']+)\1/i)
        m.to_a.each do |js|
          p js
          # scripts << js
        end
      end
      p scripts
      Process.exit

      if m.nil?
        @logger.log.info("No scripts found in source data; moving on ...")
        return scripts
      end
      # scripts = pattern.to_a.transpose[1]
      # p scripts
      # return scripts
      Process.exit

      # if !pattern.to_a.transpose.nil?
      # @scripts = pattern.to_a.transpose[1]
      # end
    end
  end
end
