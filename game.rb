require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

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
           GameTurn.take_turn(player)              
           puts player
        end
  end
  
end

if __FILE__ == $0
  game = Game.new("Nuevo Juego")
  game.addplayers(Player.new("adan"))
  game.play
end  