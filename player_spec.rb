require_relative 'player'
describe Player do
  
  before do
    @player = Player.new("larry")
  end
  
  it "has a Capitalized title" do
        expect(@player.name).to eq("Larry")
  end
  
  it "has an initial health" do
   
    expect(@player.health).to eq(100)
  end
  
         
  it "has a string representation" do
    
    expect(@player.to_s).to eq("I am Larry with a health of 100 and a score of 105")

  end

  it "computes a score as the sum of its health and length of name" do
    
    expect(@player.score).to eq(105)
  end
  

  it "increases health by 15 when w00ted" do
      
      @player.w00t
      expect(@player.health).to eq(115)  
  end
  

  it "decreases health by 10 when blammed" do
   
    @player.blam
    expect(@player.health).to eq(90)  
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
  
  
  
   

end
