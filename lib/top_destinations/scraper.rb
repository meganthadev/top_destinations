require 'pry'
class TopDestinations::Scraper
  
  
  def self.scrape_dests
  html = open("https://www.nomadicmatt.com/travel-blogs/top-ten-best-tropical-islands/")
        doc = Nokogiri::HTML(html)
        entry_content = doc.css(".entry-content")
        h3_array = entry_content.css("h3")
        h3_array.each do |dest|
            name = dest.text 
            TopDestinations::Destination.new(name)
        end
      end  
      
    def self.scrape_info
    html = open("https://www.nomadicmatt.com/travel-blogs/top-ten-best-tropical-islands/")
        doc = Nokogiri::HTML(html)
        entry_content = doc.css(".entry-content")
        info = doc.css(".entry-content ul li li li").text.strip
        info.each do |dest|
          facts = dest.text
        TopDestinations::Destination.new(facts)
        end
      end   
      
end         