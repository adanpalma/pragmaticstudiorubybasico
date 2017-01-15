require_relative 'player'

class BerserkPlayer < Player
   def initialize(player_name, player_health=100)
      @wooted_times = 0
      super(player_name, player_health)
   end

   def w00t
      super
      @wooted_times += 1
      puts "#{@name} is berserk!" if self.berserk?
   end
  
   def blam
      self.berserk? ? self.w00t : super 
   end
   
   def berserk?
      @wooted_times > 5
   
   end
end

if __FILE__  == $0
   berserkplayer = BerserkPlayer.new("Adan", 50) 
   6.times {berserkplayer.w00t}
   2.times {berserkplayer.blam}
   puts berserkplayer.health
   
end