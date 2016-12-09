require_relative 'player'
require_relative 'game'

def time
  Time.new.strftime("%I:%M:%S")
end

time = Time.new
puts "The game started on #{time.strftime("%A %d/%m/%Y at %I:%M %p")}"


player1 = Player.new("moe")
player2 = Player.new("larry",60)
player3 = Player.new("curly",125)

game = Game.new("Knuckleheads")
game.addplayers(player1)
game.addplayers(player2)
game.addplayers(player3)
game.play







#puts "#{name1.capitalize}'s health is #{health1}" 
#puts "#{name2.upcase}'s health is #{health2}"
#puts "#{name3} has a health of #{health3}".center(50,".")
#puts "#{name4.capitalize.ljust(48,".")} #{health4} health"


