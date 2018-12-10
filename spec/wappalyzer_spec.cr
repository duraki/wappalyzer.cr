require "./spec_helper"

describe Wappalyzer do
  it "should host" do
    # in spec_helper.cr
  end

  it "should initialize" do
    Wappalyzer::Scanner.new(DOMAIN)
  end

  it "should analyze response" do
    Wappalyzer::Scanner.new(DOMAIN).scan
  end

  it "should get logger instance" do
    typeof(Wappalyzer::Log)
  end
end
