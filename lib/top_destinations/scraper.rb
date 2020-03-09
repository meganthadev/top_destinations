class TopDestinations::Scraper
  
  def get_page
     Nokogiri::HTML(open("https://www.nomadicmatt.com/travel-blogs/top-ten-best-tropical-islands"))
        
       
  def make_destinations   
        entry_content = doc.css(".entry-content")
        h3_array = entry_content.css("h3")
        h3_array.each do |dest|
          
            name = dest.text
            Destination.new(name)
        end