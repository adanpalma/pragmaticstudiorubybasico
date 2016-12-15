require_relative('die')
require_relative('player')
require_relative('treasure_trove')

module GameTurn 
   def self.take_turn(player)
      die = Die.new
      
      case die.roll
      when  5..6
          player.w00t
      when  3..4
         puts "Player #{player.name} was skipped" 
      else
         player.blam          
      end  
      treasure = find_treasure
      puts " Player #{player.name} found a #{treasure.name} with a #{treasure.points} points"
      
   end
   
   def self.find_treasure
      TreasureTrove.random       
   end
   
end
