
class TopDestinations::Destination

  attr_accessor :name, :facts

  @@all = []
  
  def initialize(name)
    @name = name
    @facts = facts
    save
  end   
  
  def self.all
     TopDestinations::Scraper.scrape_dests if @@all.empty?
    @@all
  end
  
  def save
    @@all << self
  end  
  
end  