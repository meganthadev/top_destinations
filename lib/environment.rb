require_relative "./top_destinations/version"
require_relative "./top_destinations/cli"
require_relative "./top_destinations/destination"
require_relative "./top_destinations/scraper"


require 'pry'
require 'nokogiri'
require 'open-uri'
require 'bundler'

Bundler.require

module TopDestinations
  class Error < StandardError; end
end
