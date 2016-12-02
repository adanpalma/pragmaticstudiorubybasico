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

def time
  Time.new.strftime("%I:%M:%S")
end

time = Time.new
puts "The game started on #{time.strftime("%A %d/%m/%Y at %I:%M %p")}"

players = []
players << Player.new("moe")
players << Player.new("larry",60)
players << Player.new("curly", 125)

puts "the are #{players.count} players in the game:"
players.each do |player|
  puts player
end

puts "showing health of each player"
players.each do |player|
  puts player.player_health
end

players[0].w00t
players[0].w00t
puts players[0]

players[1].blam
puts players[1]

players.pop
players << Player.new("shemp",90)

puts players








#puts "#{name1.capitalize}'s health is #{health1}"
#puts "#{name2.upcase}'s health is #{health2}"
#puts "#{name3} has a health of #{health3}".center(50,".")
#puts "#{name4.capitalize.ljust(48,".")} #{health4} health"


