require_relative 'game'
require_relative 'die'

describe Game do
   before do
      @game = Game.new("Knuckleheads")
      @initial_health  = 100
      @player = Player.new("adan",@initial_health)
      
      @game.addplayers(@player)
      
      @rounds = Die.new.roll
   end
   
   
   
   
   context "w00t the player when a high (5..6) numbers is rolled " do
    it "player roll with a high number" do  
      Die.any_instance.stub(:roll).and_return(5)
      @game.play(@rounds)
      
      #@player.health.should == @initial_health + 15
      expect(@player.health).to eq(@initial_health + (@rounds*15))
   end
  end
   
   context "skip the player when a medium (3..4) numbers is rolled " do
    it "player skip with a medium number" do  
      Die.any_instance.stub(:roll).and_return(3)
      @game.play(@rounds)
      
      expect(@player.health).to eq(@initial_health)
      # @player.health.should == @initial_health
   end
   
 end
   
  context "blam the player when a low (1..2) numbers is rolled " do
   it "player blam with a low number" do  
     Die.any_instance.stub(:roll).and_return(1)
     @game.play(@rounds)
     
     expect(@player.health).to eq(@initial_health - (@rounds * 10))
      #@player.health.should == @initial_health - 10
  end
  
end

it "assigns a treasure for points during a player's turn" do
  game = Game.new("Knuckleheads")
  player = Player.new("moe")

  game.addplayers(player)

  game.play(1)

  expect(player.points).not_to be_zero
end

it "computes total points as the sum of all player points" do
  game = Game.new("Knuckleheads")

  player1 = Player.new("moe")
  player2 = Player.new("larry")

  game.addplayers(player1)
  game.addplayers(player2)

  player1.found_treasure(Treasure.new(:hammer, 50))
  player1.found_treasure(Treasure.new(:hammer, 50))
  player2.found_treasure(Treasure.new(:crowbar, 400))

  game.total_points.should == 500
end
   
   
   
end