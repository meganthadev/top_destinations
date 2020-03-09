class TopDestinations::CLI
  
  def call 
    puts "Welcome to the land of tropical island facts, brought to you by 'Banana Blammah Islands, quench your thirst for Island Living!'™"
    start
  end 
  
  def start 
    get_dest_list
      puts ""
      puts "Which destinations would you like to see? 1-10 or 11-20?"
    input = gets.strip.to_i
    get_user_list
    
  end   
  
  def get_dest_list
    #will be scraped
    @destinations = [1, 2, 3]
  end 
  
  def get_user_list
    @destinations.each_with_index do |index, dest| 
     puts "#{index + 1} #{dest}"
      end
    end 
  end   

end   