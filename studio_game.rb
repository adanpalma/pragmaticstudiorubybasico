require_relative 'player'
require_relative 'clumsy_player'
require_relative 'game'
require_relative 'die'

def time
  Time.new.strftime("%I:%M:%S")
end

time = Time.new
puts "The game started on #{time.strftime("%A %d/%m/%Y at %I:%M %p")}"

game = Game.new("Knuckleheads")

game.load_players(ARGV.shift||"players.csv")

clumsy_player = ClumsyPlayer.new("klutz",105)
game.addplayers(clumsy_player)

rounds = Die.new.roll 
loop do
    puts "Enter numbers of rouds or 'quit' to exit "
    answer = gets.chomp.downcase
    case answer
    when /^\d+$/
       game.play(answer.to_i) 
    when 'quit','exit'
           game.print_stats 
           break
    else
       puts "Please Enter a Number or 'quit'"                   
    end
    
 end
 game.save_high_scores








#puts "#{name1.capitalize}'s health is #{health1}" 
#puts "#{name2.upcase}'s health is #{health2}"
#puts "#{name3} has a health of #{health3}".center(50,".")
#puts "#{name4.capitalize.ljust(48,".")} #{health4} health"


