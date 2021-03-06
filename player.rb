require_relative 'treasure_trove'
require_relative 'playable'
class Player
   include Playable
   
  attr_accessor  :health, :name
    
  def initialize(player_name, player_health=100)
    @name = player_name.capitalize
    @health = player_health
    @found_treasures = Hash.new(0)
  end
  

  def each_found_treasure
     @found_treasures.each do |key, value|
        yield (Treasure.new(key,value))
     end

  end
  
  def name=(player_name)
    @pname = player_name.capitalize
  end  
  
  def to_s
    "I am #{@name} health = #{@health}, points = #{points}, score = #{score}"
  end
  
  
  
  def score
      @health + @found_treasures.values.reduce(0,:+)
  end
  
  
  
  def <=>(other_player)
     other_player.score <=> self.score
  end 
  
  def found_treasure(treasure)
     @found_treasures[treasure.name] += treasure.points 
     puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"
     puts "#{@name} treasures #{@found_treasures}"
  end

  def points
      @found_treasures.values.reduce(0,:+) 
  end
  
  def total_treasures
     @found_treasures.size
  end
  
  def self.from_csv(player)
     playername, health= player.split(",")
     Player.new(playername, Integer(health))
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