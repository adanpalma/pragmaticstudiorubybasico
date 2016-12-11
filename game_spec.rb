require_relative 'game'
require_relative 'die'

describe Game do
   before do
      @game = Game.new("Knuckleheads")
      @initial_health  = 100
      @player = Player.new("adan",@initial_health)
      
      @game.addplayers(@player)
   end
   
   context "w00t the player when a high (5..6) numbers is rolled " do
    it "player roll with a high number" do  
      Die.any_instance.stub(:roll).and_return(5)
      @game.play
      
      #@player.health.should == @initial_health + 15
      expect(@player.health).to eq(@initial_health + 15)
   end
  end
   
   context "skip the player when a medium (3..4) numbers is rolled " do
    it "player skip with a medium number" do  
      Die.any_instance.stub(:roll).and_return(3)
      @game.play
      
      expect(@player.health).to eq(@initial_health)
      # @player.health.should == @initial_health
   end
   
 end
   
  context "blam the player when a low (1..2) numbers is rolled " do
   it "player blam with a low number" do  
     Die.any_instance.stub(:roll).and_return(1)
     @game.play
     
     expect(@player.health).to eq(@initial_health - 10)
      #@player.health.should == @initial_health - 10
  end
  
end
   
   
   
end