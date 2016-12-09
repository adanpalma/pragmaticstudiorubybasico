class Player
  attr_reader   :health
  attr_accessor :name
    
  def initialize(player_name, player_health=100)
    @name = player_name.capitalize
    @health = player_health
  end
  
  def name=(player_name)
    @pname = player_name.capitalize
  end  
  
  def to_s
    "I am #{@name} with a health of #{@health} and a score of #{self.score}"
  end
  
  def w00t
    puts "#{@name} was w00ted!"
    @health += 15
  end
  
  def blam
    puts "#{@name} was blammed!"
    @health -= 10
  end
  
  def score
    @health + @name.length
  end
  
  def strong?
     @health > 100 
  end
  
  
end


if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end   