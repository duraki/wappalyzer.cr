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

      m = /<script[^>]+src=("|')([^"']+)\1/i.match(data)
      if m.nil?
        @logger.log.info("No scripts found in source data; moving on ...")
        return scripts
      end

      m.captures.each do |match|
        p typeof(match)
        p match
        # p match.to_a.last
      end

      p scripts
      Process.exit
    end
  end
end
