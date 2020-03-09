class WorldsBestRestaurants::Restaurant

  attr_accessor :name, :image_url, :facts

  @@all = []
  
  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
  
  def self.new_from_index_page(r)
    self.new(
      r.css("h2").text,
      "https://www.theworlds50best.com#{r.css("a").attribute("href").text}",
      r.css("h3").text,
      r.css(".position").text
      )
  end

  def initialize(name=nil, url=nil, description=nil, facts=nil)
    @name = name
    @url = url
    @description = description
    @facts = facts
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
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