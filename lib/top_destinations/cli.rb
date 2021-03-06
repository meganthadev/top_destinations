class TopDestinations::CLI

  
  def call 
    puts ""
    puts "Welcome to the land of tropical island facts, brought to you by 'Banana Blammah Islands, quench your thirst for Island Living!'™"
    get_dests
    get_facts
    list_dests
    get_user_dest
    what_next
    goodbye
  end 
  
  def get_dests 
    @dests = TopDestinations::Destination.all
    TopDestinations::Scraper.scrape_dests if @dests.empty?
  end 
  
  def get_facts 
    TopDestinations::Scraper.scrape_info if @dests[0].facts.nil?
  end   
    
  def list_dests
    puts ""
    puts "Choose a destination # to see some interesting facts!"
    puts ""
    @dests.each_with_index do |dest| 
      puts " #{dest.name}"
    end 
  end   
  
  def get_user_dest
    chosen_dest = gets.strip.to_i
    show_details_for(chosen_dest) if valid_input(chosen_dest, @dests)
  end 
    
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end 
  
  
  def show_details_for(chosen_dest)
    dest = @dests[chosen_dest -1]
    puts "----------------------------------------"
    puts"Your Destination Awaits, say Hello to ##{dest.name}"
    puts "----------------------------------------"
    puts ""
    puts "Fun Facts:
                 #{dest.facts}"
    puts ""
   end 
  
    def goodbye
      puts "Contact us, we look forward to making your Banana Blammah traveling dreams come true!"
   end
  
  def what_next
    puts ""
    puts "Contact us for the best travel experience there is! 
    Would you like to see a different destination? Please enter Y or N"
    @input = gets.strip.upcase
    if @input == "Y"
      call
    elsif @input == "N"
      TopDestinations::Scraper.scrape_info
      goodbye
      exit
    else puts ""
      puts "Sorry, I don't understand that choice."
      what_next
   end 
  end
  
  
end 