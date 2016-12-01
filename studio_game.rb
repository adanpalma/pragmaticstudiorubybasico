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

player1 = Player.new("moe",120)
player2 = Player.new("larry",120)


player1.w00t
player2.blam

puts player1.player_name
puts player1.player_health
puts player1.score


puts player2.player_name
puts player2.player_health
puts player2.score

player2.player_name="lawrence"
puts player2.player_name

puts player1
puts player2







#puts "#{name1.capitalize}'s health is #{health1}"
#puts "#{name2.upcase}'s health is #{health2}"
#puts "#{name3} has a health of #{health3}".center(50,".")
#puts "#{name4.capitalize.ljust(48,".")} #{health4} health"


