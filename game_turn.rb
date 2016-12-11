require_relative('die')
require_relative('player')

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
   end
   
end
