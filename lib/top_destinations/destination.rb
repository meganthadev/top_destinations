class TopDestinations::Destination

  attr_accessor :name, :facts, :dests

  @@all = []
  
  def initialize(name)
    @name = name
    @facts = facts
    @dests = []
    save
  end   
  
  def self.all
     TopDestinations::Scraper.scrape_dests if @@all.empty?
    @@all
  end
  
   
  def get_details
    TopDestinations::Scraper.scrape_dests if @dests.empty?
  end
  
  def save
    @@all << self
  end  
  
end  