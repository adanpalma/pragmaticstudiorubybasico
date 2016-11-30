class Player
  def initialize(player_name, player_health=100)
    @player_name = player_name.capitalize
    @player_health = player_health
  end
  
  def to_s
    "I' am #{@player_name} with health of #{@player_health}"
  end
  
  def w00t
    puts "#{@player_name} was w00ted!"
    @player_health += 15
  end
  def blam
    puts "#{@player_name} was blammed!"
    @player_health -= 10
  end
end

player1 = Player.new("moe",120)
puts player1
player1.w00t
puts player1



def time
  Time.new.strftime("%I:%M:%S")
end

def say_hello(player_name,player_health=100)
   "I'am #{player_name.capitalize} with a health of #{player_health} as of #{time}"
end


puts time
puts say_hello("larry",60)
puts say_hello("curly",125)
puts say_hello("moe")
puts say_hello("shemp", 90)


name1 = "larry"
health1 = 60
name2 = "curly"
health2 = 125
name3 = "moe"
health3 = 100
name4="shemp"
health4=90
time = Time.new
puts "The game started on #{time.strftime("%A %d/%m/%Y at %I:%M %p")}"
puts "#{name1.capitalize}'s health is #{health1}"
puts "#{name2.upcase}'s health is #{health2}"
puts "#{name3} has a health of #{health3}".center(50,".")
puts "#{name4.capitalize.ljust(48,".")} #{health4} health"


