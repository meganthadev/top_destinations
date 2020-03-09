class TopDestinations::Destination

  attr_accessor :name, :ref, :dests

  @@all = []
  
  def initialize(name, ref)
    @name = name
    @ref = ref
    @dests = []
    save
  end   
  
  def self.all
     TopDestinations::Scraper.scrape_dests if @@all.empty?
    @@all
  end
  
   
  def get_dests
    TopDestinations::Scraper.scrape_dests(self) if @dests.empty?
  end
  
  def save
    @@all << self
  end  
  
end  