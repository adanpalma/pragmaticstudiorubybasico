require_relative 'player'
require_relative 'treasure_trove'

describe Player do
  
  before do
    @player = Player.new("larry",100) 
  end
  
  
  it "has a Capitalized title" do
        expect(@player.name).to eq("Larry")
  end
  
  it "has an initial health" do
   
    expect(@player.health).to eq(100)
  end
  
         
 
  it "computes a score as the sum of its health plus total treasure points" do
     @player.found_treasure(Treasure.new(:hammer, 50))
     @player.found_treasure(Treasure.new(:hammer, 50))

    
    expect(@player.score).to eq(200)
  end
  
 context "Player has a string representation" do
    before do
       @player = Player.new("larry")
       @player.found_treasure(Treasure.new(:hammer, 50))
       @player.found_treasure(Treasure.new(:hammer, 50))
    end
    
     
  it "has a string representation" do
          puts @player
    
    expect(@player.to_s).to eq("I am Larry health = 100, points = 100, score = 200")

  end
end

  it "increases health by 15 when w00ted" do
      
      @player.w00t
      expect(@player.health).to eq(115)  
  end
  

  it "decreases health by 10 when blammed" do
   
    @player.blam
    expect(@player.health).to eq(90)  
  end
  
  it "can be created from a csv file" do
     player = Player.from_csv("Adan,50")
     expect(player.name).to eq("Adan")
     expect(player.health).to eq(50)
     
  end
  
  
  
  it "computes points as the sum of all treasure points" do
    expect(@player.points).to eq(0)

    @player.found_treasure(Treasure.new(:hammer, 50))

    expect(@player.points).to eq(50)

    @player.found_treasure(Treasure.new(:crowbar, 400))

    expect(@player.points).to eq(450)

    @player.found_treasure(Treasure.new(:hammer, 50))

    expect(@player.points).to eq(500)
  end
  
  context "a player has a health greater than 100" do
     before do
        @player = Player.new("larry",150)
     end
     
     it "is strong" do
        expect(@player).to be_strong
     end
     
     
  end
  
  context "when a player has a health less or equal to 100" do
     before do
        @player = Player.new("adan",100)
     end
     
     it "is whimpi" do
        expect(@player).not_to be_strong
     end
     
     
  end
  
  it "yields each found treasure and its total points" do
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:skillet, 100))
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))
    @player.found_treasure(Treasure.new(:bottle, 5))

    yielded = []
    @player.each_found_treasure do |treasure|
      yielded << treasure
    end

    expect(yielded).to eq([
      Treasure.new(:skillet, 200),
      Treasure.new(:hammer, 50),
      Treasure.new(:bottle, 25)
   ])
  end
  
   
end
 
 
