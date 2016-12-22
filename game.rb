require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title
  def initialize(gametitle)
    @title  = gametitle
    @players = []
  end
  
  def addplayers(player)
    @players << player
  end
  
  def play(rounds)
    puts "There are #{@players.size} in #{self.title}:"
    puts @players
    treasure = TreasureTrove::TREASURES
    
    puts "\n The are #{treasure.size} treasure to be found"
    
    treasure.each do |treasure|
       puts "A #{treasure.name} is worth #{treasure.points} points"
    end
    
    
    
   1.upto(rounds) do |round|
           puts "\n Round number: #{round} "
                 @players.each do |player|
                        GameTurn.take_turn(player)              
                        puts player
                  end
        end
           
  end
  
  def print_name_health(player)
     player.name + "....." + player.health.to_s
  end
  
  def print_stats
     puts "Statistics...."
     strong, wimpy = @players.partition {|player| player.strong?}
     puts "\n Strong Players:"
     strong.each { |player| puts self.print_name_health(player)  }
     puts "\n Wimpy Players:"
     wimpy.each { |player| puts   self.print_name_health(player) }  
     
     #sorted_players = @players.sort {|p1,p2| p2.score <=> p1.score}
     
     
     puts "Players Total Points"
     @players.each do |player|
        puts "\n #{player.name}'s point totals:"
        puts "#{player.points} grand total points"
     
     end
     
     
     
     puts "\n #{self.title} High Scores:"
     
      @players.sort.each do |player|
       puts "#{player.name.ljust(20,".")} #{player.score}"
     end    
  end
  
  def total_points
     @players.reduce(0) do |sum,player|
        sum += player.points
      end
   end
  
end

if __FILE__ == $0
  game = Game.new("Nuevo Juego")
  game.addplayers(Player.new("adan"))
  game.play
end  