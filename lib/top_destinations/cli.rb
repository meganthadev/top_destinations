class TopDestinations::CLI
  
  def call 
    puts "Welcome to the land of tropical island facts, brought to you by 'Banana Blammah Islands, quench your thirst for Island Living!'™"
    get_dests
    list_dests
    get_user_dest
    what_next
    goodbye
  end 
  
  def get_dests 
    @dests = TopDestinations::Destination.all
  end 
    
  def list_dests
    puts ""
    puts "Choose a destination # to see a photo, description and interesting facts!"
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
    dest.get_details
    puts "----------------------------------------"
    puts"Your Destination Awaits, say Hello to ##{dest.name}"
    puts "----------------------------------------"
    puts ""
    puts "Fun Facts:
                 #{dest.facts}"
    puts ""
  end 
  
  def what_next
    puts "Contact us for the best travel experience there is! 
    Would you like to see a different destination? Please enter Y or N"
    @input = gets.strip
    if @input == "Y"
      call
    elsif @input == "N"
      goodbye
  end 
  
  def goodbye
    puts "Contact us, we look forward to making your Banana Blammah traveling dreams come true!"
  end
  
end
end 