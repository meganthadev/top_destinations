require_relative "./top_destinations/version"
require_relative "./top_destinations/cli"
require_relative "./top_destinations/destination"
require_relative "./top_destinations/scraper"


require 'pry'
require 'nokogiri'
require 'open-uri'

module TopDestinations
  class Error < StandardError; end
  # Your code goes here...
end
