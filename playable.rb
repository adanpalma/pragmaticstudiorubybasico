module Playable

   def w00t
     puts "#{name} was w00ted!"
     self.health += 15
   end
  
   def blam
     puts "#{name} was blammed!"
     self.health -= 10
   end
   
   def strong?
      health > 100 
   end

end
