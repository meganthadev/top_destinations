class TopDestinations::Destination

  attr_accessor :name, :image_url, :description, :facts

  @@all = ["'A', 'B', 'C', 'D'"]
  
  def initialize(name)
    @name = name
    save
  end   
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end   
  
end  