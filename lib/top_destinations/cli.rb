class TopDestinations::CLI
  
  def call 
    puts "Welcome to the land of tropical island facts, brought to you by 'Banana Blammah Islands, quench your thirst for Island Living!'™"
    start
  end 
  
  def start 
    puts ""
    puts "Which destinations would you like to see? 1-10 or 11-20?"
    input = gets.strip.to_i
    
    print_dest(input)
    
    destination = TopDestinations::Destination.find(input.to_i)
    
    puts ""
    puts "Which destination would you like to see interesting facts for?"
    input = gets.strip
    
    print_dest(destination)
    
    puts ""
    puts "Contact us for the best travel experience there is! Would you like to see a different destination? Please enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Contact us, we look forward to making your Banana Blammah traveling dreams come true!"
      exit
    else
      puts ""
      puts "Sorry, I don't understand that answer."
      start
    end
  end   
  
   def print_destinations(from_number)
    puts ""
    puts "---------- Destination #{from_number} - #{from_number+9} ----------"
    puts ""
    TopDestinations::Destination.all[from_number-1, 10].each.with_index(from_number) do |dest, index|
      puts "#{index}. #{dest.name}"
    end
  end
  
  def print_dest(destination)
    puts ""
    puts "----------- #{destination.name} -----------"
    puts ""
    puts "Image Link:            #{destination.image_url}"
    puts ""
    puts "---------------Interesting Facts--------------"
    puts ""
    puts "Details:  #{destination.facts}"
    puts ""
  end
  
  def get_dest_list
    #will be scraped
    @destinations = [1, 2, 3]
  end 
  
  def get_user_list
    chosen.list = gets.strip
    @destinations.each_with_index(1) do |index, dest| 
     puts "#{index} #{dest}"
      end
    end 
  

end   