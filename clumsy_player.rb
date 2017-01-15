require_relative 'player'
require_relative 'treasure_trove'
class ClumsyPlayer < Player
   
   def initialize(name, health=100, boost=10)
      
      super(name,health)
      @boost_factor = boost
   end
   
   def w00t
      @boost_factor.times {super}      
   end
   
   def found_treasure(treasure)
      new_treasure = Treasure.new(treasure.name, treasure.points/2)
      super(new_treasure)
   end
   
   def boost_factor
      @boost_factor
   end
   
   
   
   if __FILE__ == $0
     clumsy = ClumsyPlayer.new("klutz")  
  
     hammer = Treasure.new(:hammer, 50)
     clumsy.found_treasure(hammer)
     clumsy.found_treasure(hammer)
     clumsy.found_treasure(hammer)
  
     crowbar = Treasure.new(:crowbar, 400)
     clumsy.found_treasure(crowbar)
  
     clumsy.each_found_treasure do |treasure|
       puts "#{treasure.points} total #{treasure.name} points"
     end
     puts "#{clumsy.points} grand total points"
   end
   
end