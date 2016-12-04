class Player
  attr_reader   :player_health
  attr_accessor :player_name
    
  def initialize(player_name, player_health=100)
    @player_name = player_name.capitalize
    @player_health = player_health
  end
  
  def player_name=(player_name)
    @player_name = player_name.capitalize
  end  
  
  def to_s
    "I' am #{@player_name} with a health of #{@player_health} and a score of #{self.score}"
  end
  
  def w00t
    puts "#{@player_name} was w00ted!"
    @player_health += 15
  end
  
  def blam
    puts "#{@player_name} was blammed!"
    @player_health -= 10
  end
  
  def score
    @player_health + @player_name.length
  end
  
end

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


