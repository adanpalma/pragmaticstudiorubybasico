require_relative 'player'

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
           player.blam
           player.w00t
           player.w00t
           puts player
        end
  end
  
end

if __FILE__ == $0
  game = Game.new("Nuevo Juego")
  game.addplayers(Player.new("adan"))
  game.play
end  