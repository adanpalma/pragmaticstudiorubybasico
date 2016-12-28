require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
require          'csv'

class Game
  attr_reader :title
  def initialize(gametitle)
    @title  = gametitle
    @players = []
  end
  
  def addplayers(player)
    @players << player
  end
  
  def load_players(file)
     CSV.foreach(file) do |registro|
        player = Player.new(registro[0],Integer(registro[1]))
           addplayers(player)
        end
     end
  
  def save_high_scores (file="high_scores.txt")
     File.open(file,"w") do |file|
        file.puts "#{@title} High Scores:"
        @players.sort.each do |player|
           file.puts high_scores_entry(player)
                     
        end
     end 
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
         if block_given?         
             if yield(total_points)   
                puts "\n\n ending game 2000+ points reached #{total_points}"
                break
             end
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
     
     @players.sort.each do |player|
        puts "\n #{player.name}'s points totals:"
             player.each_found_treasure do |treasure|
             puts "#{treasure.points} totals #{treasure.name} points"
          end
          puts "\n #{player.points} grand totals..."     
     end
     
     
     
     puts "Players Total Points"
     @players.each do |player|
        puts "\n #{player.name}'s point totals:"
        puts "#{player.points} grand total points"
     end
     
     
     
     puts "\n #{self.title} High Scores:"
     
      @players.sort.each do |player|
       puts high_scores_entry(player)
     end    
  end
  
  def high_scores_entry(player)
      
  "#{player.name.ljust(20,".")} #{player.score}"
  
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
  game.play(4)
end  