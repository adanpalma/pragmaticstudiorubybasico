require_relative 'player'
require_relative 'die'

class Game
  attr_reader :title
  def initialize(gametitle)
    @title  = gametitle
    @players = []
  end
  
  def addplayers(player)
    @players << player
  end
  
  def play
    puts "There are #{@players.size} in #{self.title}:"
    puts @players
    @players.each do |player|
       die = Die.new
       case die.number
       when  5..6
           player.w00t
       when  3..4
          puts "Player #{player.name} was skipped" 
       else
          player.blam          
       end         
           puts player
        end
  end
  
end

if __FILE__ == $0
  game = Game.new("Nuevo Juego")
  game.addplayers(Player.new("adan"))
  game.play
end  