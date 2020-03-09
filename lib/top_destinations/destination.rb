class TopDestinations::Destination

  attr_accessor :name, :image_url, :description, :facts

  @@all = []
  
  def self.new_from_doc(x)
    self.new(
      x.css("h3").text,
      "https://www.nomadicmatt.com#{r.css("a").attribute("href").text}",
      x.css("h3").text,
      x.css(".position").text
      )
  end
  
  def self.save
    @@all << self
  end   
    
  
  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def initialize(name=nil, image_url=nil, description=nil, facts=nil)
    @name = name
    @image_url = url
    @description = description
    @facts = facts
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(x)
    self.all[x-1]
  end

    def image_url
    @iamge_url ||= doc.css("div.c-4.nr.nt ul:nth-child(10) li:nth-child(2) a").text
  end

  def description
    @description ||= doc.css("div.c-8.nl.nt > p:nth-child(6)").text
  end

  def facts
    @facts ||= doc.css("div.c-8.nl.nt > p:nth-child(6)").text
  end
  
end