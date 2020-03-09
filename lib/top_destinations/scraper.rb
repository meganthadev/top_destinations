class Scraper
  
  
   html = open("https://www.nomadicmatt.com/travel-blogs/top-ten-best-tropical-islands")
        doc = Nokogiri::HTML(html)
        entry_content = doc.css(".entry-content")
        h3_array = entry_content.css("h3")
        h3_array.each do |dest|
            name = dest.text
            Destnation.new(name)
        end