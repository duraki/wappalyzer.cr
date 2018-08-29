require "uri"
require "http/client"

module Wappalyzer
  class Scanner
    getter :enumeration

    def initialize(url : String)
      @url = url
      @logger = Wappalyzer::Log.new
    end

    def scan
      scan!
    end

    def self.get_response(url : String)
      HTTP::Client.get URI.parse(fix_url(url))
    end

    def self.fix_url(url : String)
      if !url.match(/^http/)
        url = "http://#{url}"
      end
      url
    end

    private def hostname
      @hostname ||= URI.parse(@url).host
    end

    private def data
      response(@url).body
    end

    private def url
      @url
    end

    private def response(url : String)
      resp = Wappalyzer::Scanner.get_response(url)

      if resp.nil?
        raise "Got nil on response status #{resp.nil?} ... bye"
        Process.exit
      end

      follow_redirects(resp)
      resp = apply_force(resp, url)

      resp
    end

    private def follow_redirects(response)
      redirects = 0
      while response.status_code == 302 && response.body["location"]
        raise "Too many redirects" if redirects > 10

        url = response.body["location"]
        redirects += 1

        resp = Wappalyzer::Scanner.get_response(url)
      end

      resp
    end

    private def apply_force(response, url) : HTTP::Client::Response
      if response.status_code == 301
        url = url.sub("http://", "https://")
        @logger.log.info("Fixed url 'cause bad response #{response.status_code}, new cname #{url}")

        return Wappalyzer::Scanner.get_response(url)
      end

      # if nothing else works
      if response.status_code != 200
        raise "Response did not return `200 OK` got #{response.status_code}, bye ..."
        Process.exit
      end
      return Wappalyzer::Scanner.get_response(url)
    end

    def scan!
      rxs = Wappalyzer::Match.new

      @logger.log.info("Starting wappalyzer scan on target #{@url} ...")
      scripts = rxs.get_scripts(data)
    end
  end
end
