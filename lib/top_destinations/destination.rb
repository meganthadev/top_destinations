class TopDestinations::Destination

  attr_accessor :name, :ref, :description, :facts

  @@all = []
  
  def initialize(name)
    @name = name
    save
  end   
  
  def self.all
     TopDestinations::Scraper.scrape_dests if @@all.empty?
    @@all
  end
  
  def save
    @@all << self
  end   
   
  def get_dests
    TopDestinations::Scraper.scrape_dests(self) if @dests.empty?
  end
  
  
end  